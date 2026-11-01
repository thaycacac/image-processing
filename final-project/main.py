# ============================================================
# ECHO MOVE - PYTHON BACKEND (PRODUCTION)
# YOLOv8-Pose + MediaPipe Hands + IQA + WebSocket
# Chạy: Google Colab (Runtime → T4 GPU)
# ============================================================

import subprocess, sys, os

def _install():
    try:
        import ultralytics, fastapi, uvicorn, cv2, nest_asyncio  # noqa
    except ImportError:
        subprocess.check_call([sys.executable, "-m", "pip", "install", "-q",
            "ultralytics", "fastapi", "uvicorn[standard]",
            "opencv-python-headless", "nest_asyncio", "python-multipart"])
    try:
        import mediapipe  # noqa
    except ImportError:
        try:
            subprocess.check_call([sys.executable, "-m", "pip", "install", "-q", "mediapipe"])
        except: pass

_install()

import cv2, numpy as np, nest_asyncio, uvicorn, asyncio
import json, math, base64, time, threading, re

try:
    import mediapipe as mp
    mp_hands = mp.solutions.hands
    HANDS_AVAILABLE = True
except: HANDS_AVAILABLE = False

nest_asyncio.apply()

MODEL_NAME = "yolov8n-pose.pt"
CONF_THRESHOLD = 0.30
PORT = 8000

# ═══════════════════════════════════════════════════
# ONE EURO FILTER
# ═══════════════════════════════════════════════════
class OneEuroFilter:
    def __init__(self, min_cutoff=1.0, beta=0.007, d_cutoff=1.0):
        self.min_cutoff, self.beta, self.d_cutoff = min_cutoff, beta, d_cutoff
        self.x_prev = self.dx_prev = self.t_prev = None
    def __call__(self, x, t):
        if self.t_prev is None:
            self.t_prev, self.x_prev, self.dx_prev = t, x, np.zeros_like(x)
            return x
        dt = max(t - self.t_prev, 1e-3)
        dx = (x - self.x_prev) / dt
        alpha_d = 1.0 / (1.0 + self.d_cutoff / (2*math.pi*dt))
        dx_hat = alpha_d*dx + (1-alpha_d)*self.dx_prev
        cutoff = self.min_cutoff + self.beta*np.abs(dx_hat)
        alpha = 1.0 / (1.0 + cutoff/(2*math.pi*dt))
        x_hat = alpha*x + (1-alpha)*self.x_prev
        self.t_prev, self.x_prev, self.dx_prev = t, x_hat, dx_hat
        return x_hat

class BodyFilterBank:
    def __init__(self): self.reset()
    def reset(self):
        self.fx = [OneEuroFilter(1.0, 0.007) for _ in range(17)]
        self.fy = [OneEuroFilter(1.0, 0.007) for _ in range(17)]
        self.start = time.time()
    def apply(self, kps):
        t = time.time() - self.start
        out = []
        for i, kp in enumerate(kps):
            if kp[2] > CONF_THRESHOLD:
                sx = float(self.fx[i](np.array([kp[0]]), t)[0])
                sy = float(self.fy[i](np.array([kp[1]]), t)[0])
                out.append([sx, sy, float(kp[2])])
            else: out.append([float(kp[0]), float(kp[1]), float(kp[2])])
        return out

class FingerFilterBank:
    def __init__(self): self.reset()
    def reset(self):
        self.filters = [OneEuroFilter(1.5, 0.02) for _ in range(10)]
        self.start = time.time()
    def apply(self, curls):
        t = time.time() - self.start
        return [float(self.filters[i](np.array([c]), t)[0]) for i, c in enumerate(curls)]

# ═══════════════════════════════════════════════════
# IQA ENGINE (5 METRICS)
# ═══════════════════════════════════════════════════
def analyze_quality(frame):
    """Image Quality Assessment - 5 metrics"""
    try:
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        # Metric 1: Brightness (First-order statistic)
        brightness = float(np.mean(gray))
        # Metric 2: Contrast (Second-order statistic)
        contrast = float(np.std(gray))
        # Metric 3: Sharpness (Laplacian variance)
        sharpness = float(cv2.Laplacian(gray, cv2.CV_64F).var())
        # Metric 4: Edge Density (Canny)
        edges = cv2.Canny(cv2.GaussianBlur(gray, (5,5), 0), 50, 150)
        edge_density = float(np.sum(edges > 0)) / edges.size * 100
        
        # Metric 5: Quality Score (Multi-metric Fusion)
        b_score = 1.0 if 80 < brightness < 180 else max(0, 1 - abs(brightness-130)/130)
        c_score = min(1.0, contrast/60)
        s_score = min(1.0, sharpness/200)
        quality_score = b_score*0.3 + c_score*0.35 + s_score*0.35
        
        return {
            "brightness": round(brightness, 1),
            "contrast": round(contrast, 1),
            "sharpness": round(sharpness, 1),
            "edge_density": round(edge_density, 2),
            "quality_score": round(float(quality_score), 2)
        }
    except:
        return {"brightness":0,"contrast":0,"sharpness":0,"edge_density":0,"quality_score":0}

# ═══════════════════════════════════════════════════
# LOAD MODELS
# ═══════════════════════════════════════════════════
print("🤖 Loading models...")
import torch
device = "cuda" if torch.cuda.is_available() else "cpu"

from ultralytics import YOLO
body_model = YOLO(MODEL_NAME).to(device)
body_filter = BodyFilterBank()
finger_filter = FingerFilterBank()
print(f"✅ YOLOv8 on {device.upper()}")

hands_detector = None
if HANDS_AVAILABLE:
    hands_detector = mp_hands.Hands(
        max_num_hands=2, model_complexity=0,
        min_detection_confidence=0.5, min_tracking_confidence=0.5)
    print("✅ MediaPipe Hands")

# ═══════════════════════════════════════════════════
# FINGER CURLS
# ═══════════════════════════════════════════════════
def compute_finger_curls(frame_bgr):
    result = [0.0] * 10
    if hands_detector is None: return result
    try:
        rgb = cv2.cvtColor(frame_bgr, cv2.COLOR_BGR2RGB)
        rgb.flags.writeable = False
        res = hands_detector.process(rgb)
        rgb.flags.writeable = True
        if not res.multi_hand_landmarks: return result
        for h_idx, lm_list in enumerate(res.multi_hand_landmarks[:2]):
            lm = lm_list.landmark
            side = res.multi_handedness[h_idx].classification[0].label
            offset = 5 if side == "Right" else 0
            fingers = [(1,2,4),(5,6,8),(9,10,12),(13,14,16),(17,18,20)]
            for f_idx, (mcp_i,pip_i,tip_i) in enumerate(fingers):
                v1x = lm[pip_i].x-lm[mcp_i].x; v1y = lm[pip_i].y-lm[mcp_i].y
                v2x = lm[tip_i].x-lm[pip_i].x; v2y = lm[tip_i].y-lm[pip_i].y
                m1 = math.sqrt(v1x**2+v1y**2)+1e-6
                m2 = math.sqrt(v2x**2+v2y**2)+1e-6
                dot = v1x*v2x + v1y*v2y
                cos_a = max(-1.0, min(1.0, dot/(m1*m2)))
                curl = math.acos(cos_a)/math.pi
                if f_idx == 0: curl = min(1.0, curl*1.3)
                result[offset+f_idx] = curl
    except: pass
    return result

# ═══════════════════════════════════════════════════
# GESTURE CLASSIFICATION
# ═══════════════════════════════════════════════════
_last_punch = 0
def classify_gesture(kps):
    global _last_punch
    now = time.time()
    if now - _last_punch < 0.6 or len(kps) < 17: return 0
    ls, rs = kps[5], kps[6]
    lw, rw = kps[9], kps[10]
    if lw[2]>0.4 and ls[2]>0.4 and abs(lw[0]-ls[0])>60:
        _last_punch = now; return 1
    if rw[2]>0.4 and rs[2]>0.4 and abs(rw[0]-rs[0])>60:
        _last_punch = now; return 2
    if lw[2]>0.4 and rw[2]>0.4 and lw[1]<ls[1] and rw[1]<rs[1]:
        _last_punch = now; return 3
    return 0

# ═══════════════════════════════════════════════════
# FASTAPI
# ═══════════════════════════════════════════════════
from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from fastapi.responses import HTMLResponse, JSONResponse
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()
app.add_middleware(CORSMiddleware, allow_origins=["*"], allow_methods=["*"], allow_headers=["*"])

stats = {"frames":0, "clients":0, "started_at":time.time()}

@app.get("/")
async def root():
    return HTMLResponse(f"""
    <html><body style="background:#050a15;color:#00ffcc;font-family:monospace;padding:40px;">
        <h1>🎬 ECHO MOVE Backend</h1>
        <p style="color:#fff;">Image Processing × 3D Motion Retargeting</p>
        <hr style="border-color:#1e293b;">
        <p>Model: {MODEL_NAME} | Device: {device.upper()}</p>
        <p>MediaPipe: {'✅' if HANDS_AVAILABLE else '❌'}</p>
        <p>Frames: {stats['frames']} | Clients: {stats['clients']}</p>
    </body></html>""")

@app.get("/health")
async def health():
    return JSONResponse({"status":"ok","model":MODEL_NAME,"device":device,
        "mediapipe":HANDS_AVAILABLE,"frames":stats["frames"],
        "clients":stats["clients"],"uptime":int(time.time()-stats["started_at"])})

@app.websocket("/ws/pose")
async def ws_endpoint(ws: WebSocket):
    await ws.accept()
    stats["clients"] += 1
    print(f"✅ Client #{stats['clients']}")
    body_filter.reset(); finger_filter.reset()
    
    try:
        while True:
            data_url = await ws.receive_text()
            try:
                # 1. DECODE
                enc = data_url.split(",",1)[1] if "," in data_url else data_url
                frame = cv2.imdecode(np.frombuffer(base64.b64decode(enc), np.uint8), cv2.IMREAD_COLOR)
                if frame is None:
                    await ws.send_text(json.dumps({"detected":False,"keypoints":[],"fingers":[0]*10,"spell":0,"quality":{},"edges":{}}))
                    continue
                
                # 2. RESIZE
                h, w = frame.shape[:2]
                if w > 640: frame = cv2.resize(frame, (640, int(h*640/w)))
                
                # 3. IQA
                quality = analyze_quality(frame)
                
                # 4. BODY
                results = body_model(frame, verbose=False, conf=0.25)
                response = {"detected":False,"keypoints":[],"fingers":[0]*10,"spell":0,
                           "quality":quality,"edges":{"edge_density":quality["edge_density"]}}
                
                if len(results) > 0 and results[0].keypoints is not None:
                    kps = results[0].keypoints.data.cpu().numpy()
                    if len(kps) > 0:
                        raw = kps[0].tolist()
                        if len(raw) == 17:
                            response["detected"] = True
                            response["keypoints"] = body_filter.apply(raw)
                            response["spell"] = classify_gesture(response["keypoints"])
                            stats["frames"] += 1
                
                # 5. FINGERS
                raw_curls = compute_finger_curls(frame)
                response["fingers"] = finger_filter.apply(raw_curls)
                
                await ws.send_text(json.dumps(response))
                
            except Exception as e:
                print(f"⚠️ Error: {type(e).__name__}")
                try:
                    await ws.send_text(json.dumps({"detected":False,"keypoints":[],"fingers":[0]*10,"spell":0,"quality":{},"edges":{}}))
                except: break
    except WebSocketDisconnect: pass
    finally: stats["clients"] = max(0, stats["clients"]-1)

# ═══════════════════════════════════════════════════
# TUNNEL
# ═══════════════════════════════════════════════════
def start_tunnel():
    if not os.path.exists("./cloudflared"):
        subprocess.run(["wget","-q","https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64","-O","cloudflared"])
        subprocess.run(["chmod","+x","cloudflared"])
    proc = subprocess.Popen(["./cloudflared","tunnel","--url",f"http://localhost:{PORT}","--no-autoupdate"],
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    url = None
    deadline = time.time() + 30
    def reader():
        nonlocal url
        for line in proc.stdout:
            m = re.search(r"https://[a-zA-Z0-9-]+\.trycloudflare\.com", line)
            if m and url is None:
                url = m.group(0)
                print(f"\n{'='*70}\n🌐 TUNNEL: {url}\n🔌 WS: {url.replace('https://','wss://')}/ws/pose\n{'='*70}\n")
                break
    threading.Thread(target=reader, daemon=True).start()
    while url is None and time.time() < deadline:
        time.sleep(0.5)
    return url

def main():
    print("="*70)
    print("🎬 ECHO MOVE - Image Processing Backend")
    print("="*70)
    print(f"Device: {device.upper()} | Model: {MODEL_NAME}")
    print(f"MediaPipe: {'✅' if HANDS_AVAILABLE else '❌'}")
    print("="*70 + "\n")
    if sys.platform.startswith("linux") and not os.environ.get("NO_TUNNEL"):
        start_tunnel()
    else:
        print(f"🏠 Local mode: ws://localhost:{PORT}/ws/pose")
    try:
        uvicorn.run(app, host="0.0.0.0", port=PORT, log_level="warning", access_log=False)
    except RuntimeError:
        def _run():
            loop = asyncio.new_event_loop(); asyncio.set_event_loop(loop)
            cfg = uvicorn.Config(app, host="0.0.0.0", port=PORT, log_level="warning")
            loop.run_until_complete(uvicorn.Server(cfg).serve())
        threading.Thread(target=_run, daemon=True).start()
        while True: time.sleep(1)

if __name__ == "__main__":
    main()