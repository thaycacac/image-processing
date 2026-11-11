# Chương 16 — Xử lý ảnh màu

Ảnh màu có thể được biểu diễn trong nhiều không gian màu, mỗi không gian làm nổi bật những thuộc tính khác nhau. Các lab đi từ biểu diễn RGB/HSV/YCbCr/Lab đến giả màu, xử lý histogram và lọc/phân đoạn màu.

## Kiến thức cần nhớ

- RGB lưu ba thành phần đỏ, lục, lam; HSV tách sắc độ, độ bão hòa và độ sáng; YCbCr tách độ chói khỏi thành phần màu. Lab được thiết kế gần đồng đều theo cảm nhận.
- Giả màu ánh xạ mức xám sang màu để làm nổi bật dải cường độ; màu hiển thị không phải màu đo được của vật thể.
- Khi tăng tương phản ảnh màu, thường xử lý kênh độ sáng/chói để hạn chế thay đổi sắc độ.
- Lọc từng kênh RGB độc lập có thể làm thay đổi màu. Trong nhiều ứng dụng, lọc kênh độ chói rồi giữ nguyên thành phần màu cho kết quả tự nhiên hơn.
- Phân đoạn màu cần xét cả không gian màu, ngưỡng và độ biến thiên ánh sáng; ngưỡng RGB đơn giản thường nhạy với điều kiện chụp.
- Các phép chuyển đổi và xử lý ảnh màu trong bài cần Image Processing Toolbox.

## Các lab

1. `lab01_khong_gian_mau.m` — so sánh RGB, HSV, YCbCr và Lab.
2. `lab02_gia_mau_va_cat_dai.m` — giả màu và phân dải cường độ.
3. `lab03_bien_doi_anh_mau.m` — điều chỉnh sắc độ, độ bão hòa và độ sáng.
4. `lab04_can_bang_histogram_mau.m` — cân bằng histogram trên ảnh xám và kênh độ sáng.
5. `lab05_loc_va_khu_nhieu_mau.m` — làm trơn, khử nhiễu và tăng nét ảnh màu.
6. `lab06_phan_doan_va_bien_mau.m` — phân đoạn theo màu Lab và so sánh phát hiện biên.

Mỗi bài có file `loigiai_...m` đi kèm. Ảnh `statue.png` nằm trong `matlab/data` cùng repo. Mở script trong MATLAB và nhấn **Run**.
