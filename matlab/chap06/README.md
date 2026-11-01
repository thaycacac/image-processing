# Chương 6 — Phép toán số học và logic trên ảnh

Chương này học cách kết hợp ảnh theo từng pixel bằng phép cộng, trừ, nhân, chia và logic. Kết quả thường dùng để trộn ảnh, điều chỉnh sáng, tạo ảnh sai khác, tạo ảnh âm, thêm nhiễu hoặc giới hạn xử lý trong một vùng quan tâm (ROI).

## Kiến thức cần nhớ

### Phép toán số học

- Cộng ảnh: `Z = X + Y` hoặc `imadd(X,Y)`; dùng để trộn nội dung, cộng hằng số sáng hoặc mô phỏng nhiễu cộng.
- Trừ ảnh: `imsubtract(X,Y)`; dùng để tìm khác biệt có hướng hoặc giảm sáng. `imabsdiff(X,Y)` cho trị tuyệt đối của hiệu.
- Ảnh âm: `imcomplement(I)` đảo mức sáng, ví dụ ảnh xám 8-bit: `255 - I`.
- Nhân/chia: `immultiply`, `imdivide` hoặc phép toán phần tử `.*`, `./`; dùng để co giãn cường độ và áp dụng mặt nạ.
- Với ảnh `uint8`, kết quả thường bị giới hạn trong [0,255] (bão hòa). Khi cần giữ tổng vượt 255, mở rộng kiểu trước: `uint16(X)+uint16(Y)`. Sau đó chọn cách xử lý: cắt ngưỡng, chuẩn hóa hoặc giữ kiểu rộng.
- Khi cộng ảnh, hai ảnh cần cùng kích thước và kiểu tương thích. Phép chia cần xử lý mẫu số bằng 0.

### Phép logic và ROI

- `AND`, `OR`, `XOR`, `NOT` kết hợp mask nhị phân; thường `1/true` là vùng trắng/chọn, `0/false` là nền.
- Với ảnh xám, các hàm `bitand`, `bitor`, `bitxor`, `bitcmp` thao tác trên bit của từng giá trị pixel. Đây là phép bitwise, không đồng nghĩa với phép logic trên mask.
- ROI là vùng ảnh được chọn bằng mask. Có thể giữ pixel trong ROI và đặt phần còn lại về 0, hoặc chỉ thay đổi pixel thuộc ROI.

## Các lab đã giải

1. `lab01_cong_anh_va_tran_so.m` — cộng/trộn ảnh và so sánh bão hòa với chuẩn hóa.
2. `lab02_tru_anh_va_anh_am.m` — trừ có hướng, sai khác tuyệt đối và ảnh âm.
3. `lab03_nhan_chia_va_dieu_chinh_sang.m` — nhân/chia cường độ, tránh chia cho 0.
4. `lab04_nhieu_cong.m` — cộng nhiễu Gaussian và giới hạn miền giá trị.
5. `lab05_phep_logic_mask.m` — AND/OR/XOR/NOT trên mask nhị phân.
6. `lab06_roi_bang_mask.m` — chọn ROI và xử lý riêng vùng đó.

Mỗi bài có file `loigiai_lab...m` tham khảo. Các ví dụ tạo ảnh nhỏ ngay trong code, không cần tải thêm dữ liệu. Mở file lab trong MATLAB rồi nhấn **Run**.
