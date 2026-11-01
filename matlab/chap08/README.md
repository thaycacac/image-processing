# Chương 8 — Biến đổi mức xám

Biến đổi mức xám là phép biến đổi điểm: giá trị đầu ra tại mỗi pixel được tính trực tiếp từ mức xám của pixel đầu vào, `s = T(r)`. Mục tiêu là cải thiện ảnh để con người quan sát hoặc làm ảnh phù hợp hơn cho phân tích tự động.

## Kiến thức cần nhớ

- **Tuyến tính**: `s = c*r + b`. `c` điều khiển tương phản, `b` điều khiển độ sáng. Giá trị đầu ra cần giới hạn vào miền hợp lệ, thường [0,1] hoặc [0,255].
- **Ảnh âm**: `s = Lmax - r`, đảo sáng/tối; MATLAB: `imcomplement`.
- **Log**: `s = c*log(1+r)`, thường mở rộng vùng tối và nén vùng sáng. Chọn hệ số để đầu ra nằm trong miền mong muốn.
- **Lũy thừa/gamma**: `s = r^gamma`; với ảnh đã chuẩn hóa [0,1], gamma < 1 làm sáng hơn, gamma > 1 làm tối hơn. MATLAB: `imadjust(I,[],[],gamma)`.
- **Biến đổi từng đoạn**: nối các đoạn tuyến tính để kéo giãn tương phản hoặc làm nổi bật một dải mức xám (gray-level slicing).
- **Tăng tương phản tự động**: xác định dải đầu vào hữu ích rồi ánh xạ về toàn dải hiển thị; `stretchlim` và `imadjust` là các hàm tiện dụng.
- Phân biệt giá trị ảnh với cách hiển thị: `imshow(I,[low high])` chỉ thay đổi ánh xạ hiển thị; `imadjust` tạo ảnh mới với giá trị pixel đã biến đổi.
- Các hàm IPT như `imadjust` thường thuận tiện nhất khi ảnh `double` ở [0,1] hoặc `uint8` ở [0,255].

## Các lab đã giải

1. `lab01_tuyen_tinh_sang_tuong_phan.m` — điều chỉnh brightness/contrast bằng công thức tuyến tính.
2. `lab02_anh_am.m` — đảo tương phản bằng `imcomplement`.
3. `lab03_bien_doi_log.m` — log transform và tác động lên vùng tối.
4. `lab04_gamma.m` — so sánh gamma nhỏ, bằng 1 và lớn.
5. `lab05_bien_doi_tung_doan.m` — contrast stretching và gray-level slicing.
6. `lab06_tang_tuong_phan_tu_dong.m` — `stretchlim`, `imadjust` và giới hạn hiển thị.

Mỗi lab có file `loigiai_lab...m` tham khảo. Script dùng ảnh xám `Practice/lenna.tif` và tự tìm đường dẫn. Mở file lab trong MATLAB rồi nhấn **Run**.
