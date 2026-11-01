# Chương 10 — Xử lý lân cận

Xử lý lân cận tạo pixel đầu ra từ một vùng pixel xung quanh vị trí tương ứng trong ảnh đầu vào. Mặt nạ (kernel) xác định cách các pixel lân cận đóng góp.

## Kiến thức cần nhớ

- **Lọc tuyến tính** tính tổng có trọng số của pixel lân cận. **Lọc phi tuyến** thường sắp thứ tự các giá trị trong vùng rồi chọn một giá trị, như median.
- **Tích chập** lật kernel 180° trước khi nhân-tổng; **tương quan** không lật kernel. Với kernel đối xứng, hai kết quả thường giống nhau.
- `conv2`, `filter2`, `imfilter` thực hiện lọc 2D. `imfilter` cho phép chọn cách xử lý biên: zero, replicate, symmetric hoặc circular.
- **Thông thấp/làm trơn** giảm chi tiết tần số cao và nhiễu. Mean/box filter làm trung bình đồng đều; Gaussian gán trọng số lớn hơn cho pixel gần tâm; median hữu ích với nhiễu muối tiêu.
- **Thông cao/làm sắc nét** nhấn mạnh biến thiên nhanh và biên. Laplacian là đạo hàm bậc hai gần đẳng hướng; kernel định hướng/emboss nhấn mạnh một hướng.
- **Unsharp masking** lấy ảnh trừ phiên bản đã làm mờ để tạo mặt nạ chi tiết, sau đó cộng chi tiết trở lại. High-boost giữ thêm trọng số ảnh gốc.
- Có thể chỉ lọc vùng quan tâm (ROI) bằng mask; `roifilt2` áp dụng bộ lọc trong ROI.
- Thứ tự và tham số lọc phụ thuộc bài toán; làm trơn quá mạnh sẽ xóa chi tiết, làm sắc quá mạnh sẽ khuếch đại nhiễu.

## Các lab đã giải

1. `lab01_tich_chap_tuong_quan.m` — so sánh convolution và correlation với kernel bất đối xứng.
2. `lab02_lam_tron_mean_gaussian.m` — mean và Gaussian blur.
3. `lab03_median_khu_nhieu.m` — so sánh median với mean khi có nhiễu muối tiêu.
4. `lab04_xu_ly_bien_anh.m` — tác động của các quy tắc biên khi lọc.
5. `lab05_laplacian_va_dinh_huong.m` — Laplacian, làm sắc nét và kernel định hướng.
6. `lab06_unsharp_highboost.m` — unsharp mask và high-boost.
7. `lab07_loc_trong_roi.m` — lọc ảnh chỉ trong ROI bằng mask.

Mỗi lab có file lời giải tương ứng. Ảnh xám mẫu là `Practice/lenna.tif`; script tự tìm đường dẫn. Các bài cần Image Processing Toolbox.
