# Chương 14 — Phát hiện biên

Biên là nơi mức xám, màu hoặc kết cấu thay đổi rõ rệt. Phát hiện biên thường gồm giảm nhiễu, tìm điểm biên và định vị biên; kết quả có thể dùng để phân đoạn, đo đạc và nhận dạng đối tượng.

## Kiến thức cần nhớ

- Toán tử đạo hàm bậc nhất ước lượng gradient: độ lớn biểu thị cường độ biên, hướng gradient liên quan hướng vuông góc với biên. Roberts, Prewitt và Sobel khác nhau ở mặt nạ và mức làm trơn.
- Laplacian là đạo hàm bậc hai, nhạy với nhiễu và có thể cho biên kép. Zero-crossing định vị nơi dấu đáp ứng đổi chiều.
- LoG làm trơn Gaussian trước khi áp dụng Laplacian; DoG xấp xỉ LoG bằng hiệu hai Gaussian.
- Canny làm trơn, tính gradient, triệt cực đại không cục bộ, rồi dùng ngưỡng kép và liên kết hysteresis. Ngưỡng và độ lệch chuẩn Gaussian quyết định độ nhạy.
- Hough ánh xạ điểm biên sang không gian tham số đường thẳng (ρ, θ). `houghpeaks` tìm đỉnh tích lũy và `houghlines` dựng các đoạn thẳng ứng viên.
- Lọc giảm nhiễu trước khi phát hiện biên thường giúp giảm đáp ứng giả, nhưng làm trơn quá mức có thể mất biên yếu.
- Các hàm `edge`, `hough`, `houghpeaks`, `houghlines` cần Image Processing Toolbox.

## Các lab

1. `lab01_toan_tu_bac_nhat.m` — so sánh Roberts, Prewitt, Sobel và Kirsch.
2. `lab02_nguong_sobel.m` — khảo sát ngưỡng Sobel và ảnh hưởng của nhiễu.
3. `lab03_laplacian_log_dog.m` — Laplacian zero-crossing, LoG và DoG.
4. `lab04_canny_va_nguong_kep.m` — Canny với các ngưỡng và độ lệch chuẩn khác nhau.
5. `lab05_hough_duong_thang.m` — Hough transform, đỉnh tích lũy và dựng đường thẳng.
6. `lab06_quy_trinh_phat_hien_bien.m` — tiền xử lý và so sánh các bộ phát hiện trên ảnh nhiễu.

Mỗi bài có file `loigiai_...m` đi kèm. Ảnh mẫu `cameraman2.tif` và `shapes23.png` nằm trong `matlab/data`, đã được đóng gói cùng repo.
