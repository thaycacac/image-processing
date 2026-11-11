# Chương 7 — Phép biến đổi hình học

Phép biến đổi hình học thay đổi vị trí các pixel và quan hệ không gian giữa các điểm ảnh. Ứng dụng gồm sửa méo, cắt/xoay/đổi kích thước, biến dạng và đăng ký ảnh.

## Kiến thức cần nhớ

- Mỗi phép biến đổi có **hàm ánh xạ tọa độ** và cách nội suy để xác định giá trị pixel đầu ra.
- **Forward mapping** đưa từng pixel nguồn sang vị trí đích; có thể tạo lỗ trống. **Inverse mapping** hỏi mỗi pixel đích cần lấy mẫu từ vị trí nào của ảnh nguồn; thường được dùng để tránh lỗ.
- Nội suy nearest-neighbor chọn pixel gần nhất (nhanh, giữ nhãn nhưng răng cưa); bilinear lấy trung bình có trọng số 4 pixel lân cận (mượt hơn); bicubic dùng vùng lân cận lớn hơn (thường nét/mượt hơn nhưng tốn tính toán).
- Biến đổi affine gồm tịnh tiến, co giãn, quay và shear; giữ đường thẳng và tính song song. Tổ hợp affine có thể biểu diễn bằng ma trận đồng nhất 3×3.
- Các lệnh tiện ích: `imresize`, `imrotate`, `imcrop`, `flipud`, `fliplr`. Biến đổi tổng quát trong MATLAB mới thường dùng `affine2d`/`imwarp`.
- **Warping** dùng ánh xạ phi tuyến hoặc control points. Twirl/ripple là ví dụ biến dạng phi tuyến. Morphing kết hợp warp theo thời gian với hòa trộn hai ảnh. Seam carving thay đổi kích thước bằng cách xóa/chèn đường seam có năng lượng thấp.
- **Đăng ký ảnh (image registration)** tìm phép biến đổi để căn chỉnh ảnh moving với ảnh fixed, thường dựa trên đặc trưng hoặc tương quan cường độ.

## Các lab đã giải

1. `lab01_resize_noi_suy.m` — thay đổi kích thước và so sánh nearest/bilinear/bicubic.
2. `lab02_crop_flip.m` — cắt vùng và lật ngang/dọc.
3. `lab03_xoay_anh.m` — xoay ảnh và quan sát ảnh hưởng kích thước đầu ra.
4. `lab04_bien_doi_affine.m` — tịnh tiến, co giãn và shear bằng `affine2d`/`imwarp`.
5. `lab05_warp_phi_tuyen_ripple.m` — inverse mapping phi tuyến và nội suy bằng `interp2`.
6. `lab06_dang_ky_anh.m` — tạo ảnh lệch, ước lượng tịnh tiến và căn chỉnh bằng `imregcorr`.

Mỗi lab có file `loigiai_lab...m` tham khảo. Script dùng ảnh mẫu ở thư mục `matlab/data` và tự tìm đường dẫn. Cần Image Processing Toolbox; các phép affine/đăng ký dùng API MATLAB tương đối mới (`affine2d`, `imwarp`, `imregcorr`).
