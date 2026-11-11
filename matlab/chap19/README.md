# Chương 19 — Nhận dạng mẫu thị giác

Nhận dạng mẫu biến vector đặc trưng thành nhãn lớp. Quy trình thường gồm chuẩn hóa dữ liệu, chia tập huấn luyện/kiểm tra, huấn luyện bộ phân lớp, dự đoán và đánh giá lỗi. Các lab dùng dữ liệu đặc trưng tổng hợp có thể tái tạo, nên không cần tải bộ dữ liệu ngoài.

## Kiến thức cần nhớ

- Mỗi mẫu được biểu diễn bằng vector đặc trưng; các chiều cần có thang đo phù hợp trước khi tính khoảng cách.
- Minimum-distance gán mẫu vào tâm lớp gần nhất; k-NN bỏ phiếu từ k mẫu huấn luyện gần nhất; Gaussian Bayes dùng xác suất lớp và phân phối đặc trưng.
- Tập kiểm tra phải độc lập với huấn luyện. Tham số tiền xử lý như trung bình và độ lệch chuẩn chỉ được ước lượng từ tập huấn luyện.
- Confusion matrix cho biết kiểu nhầm lẫn giữa lớp thật và lớp dự đoán. Accuracy, precision, recall và F1 bổ sung các góc nhìn về lỗi.
- ROC biểu diễn trade-off giữa true positive rate và false positive rate khi thay đổi ngưỡng quyết định.
- Kết quả phụ thuộc cách tạo mẫu, chia dữ liệu, đặc trưng và giả định của bộ phân lớp; các ví dụ nhỏ chỉ minh họa quy trình.

## Các lab

1. `lab01_vector_dac_trung_va_khong_gian.m` — biểu diễn mẫu trong không gian đặc trưng.
2. `lab02_tien_xu_ly_va_chia_du_lieu.m` — chuẩn hóa và chia train/test không rò rỉ dữ liệu.
3. `lab03_minimum_distance.m` — phân lớp theo tâm lớp gần nhất.
4. `lab04_k_nearest_neighbors.m` — phân lớp k-NN với nhiều giá trị k.
5. `lab05_bayes_gaussian.m` — phân lớp Gaussian naïve Bayes.
6. `lab06_danh_gia_bo_phan_lop.m` — confusion matrix, accuracy, precision/recall/F1 và ROC.

Các cặp lab/lời giải dùng chung `pattern_dataset.m` để tạo bộ 3 lớp và phép chia phân tầng cố định. Chỉ cần MATLAB cơ bản; các biểu đồ dùng hàm vẽ tiêu chuẩn.
