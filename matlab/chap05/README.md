# Chương 5 — Thu nhận và số hóa ảnh

Chương này giải thích ảnh hình thành và được cảm biến thu nhận ra sao, rồi trở thành dữ liệu số như thế nào. Trọng tâm thực hành là **lấy mẫu (sampling)** theo không gian và **lượng tử hóa (quantization)** theo mức xám.

## Kiến thức cần nhớ

### Thu nhận ảnh và cảm biến

- Hệ thống thu nhận ảnh thường gồm nguồn năng lượng/ánh sáng, vật thể, quang học (ống kính), cảm biến và mạch chuyển đổi tín hiệu thành dữ liệu số.
- Ảnh phản xạ ghi nhận ánh sáng phản xạ từ bề mặt; ảnh phát xạ ghi nhận năng lượng do vật thể tự phát ra (ví dụ ngôi sao); ảnh hấp thụ ghi nhận mức năng lượng bị hấp thụ, như ảnh X-quang.
- Chất lượng ảnh phụ thuộc ánh sáng, ống kính, cảm biến, nhiễu, thời gian phơi sáng và cách số hóa.
- Màu sắc thường được mô tả bằng độ sáng (brightness/value), sắc độ (hue) và độ bão hòa (saturation); RGB là cách mã hóa phổ biến trên thiết bị số.

### Số hóa: lấy mẫu và lượng tử hóa

- **Lấy mẫu** rời rạc hóa tọa độ không gian: liên tục theo x,y thành lưới pixel. Số mẫu theo chiều cao/rộng quyết định kích thước không gian.
- **Lượng tử hóa** rời rạc hóa biên độ: các mức sáng liên tục được ánh xạ vào số mức hữu hạn. N bit biểu diễn tối đa `2^N` mức.
- Vì vậy, **số hóa = lấy mẫu + lượng tử hóa**. Giảm lấy mẫu làm mất chi tiết không gian; giảm mức lượng tử làm mất sắc độ/mức xám và có thể tạo banding.
- Lấy mẫu thiếu so với chi tiết/tần số cao nhất gây aliasing, moiré hoặc răng cưa; trong thực tế cần lọc thông thấp trước khi giảm kích thước.

### Độ phân giải

- **Độ phân giải không gian** liên quan số/mật độ pixel biểu diễn cảnh; nhiều pixel hơn có thể giữ chi tiết nhỏ hơn nếu quang học và cảm biến cung cấp đủ thông tin.
- **Độ phân giải mức xám** là số mức cường độ phân biệt được, thường xác định bởi số bit/pixel.
- DPI mô tả mật độ khi in/hiển thị theo kích thước vật lý; riêng DPI không cho biết tổng pixel nếu chưa biết kích thước in.

### MATLAB

- Đọc ảnh: `imread`; xem kích thước: `size`; đổi ảnh sang [0,1]: `im2double`.
- Chuyển RGB sang xám: `rgb2gray`; RGB sang HSV: `rgb2hsv`.
- Lượng tử hóa L mức đều: `round(I*(L-1))/(L-1)` khi `I` ở [0,1]. IPT cũng có `grayslice`.
- Giảm mẫu trực tiếp bằng chỉ số, ví dụ `I(1:4:end,1:4:end)`; nội suy khi phóng lại không khôi phục chi tiết đã mất.

## Các lab đã giải

1. `lab01_quy_trinh_thu_nhan.m` — phân loại ảnh phản xạ/phát xạ/hấp thụ và mô hình hệ thống.
2. `lab02_lay_mau_khong_gian.m` — giảm mật độ pixel và quan sát mất chi tiết.
3. `lab03_luong_tu_hoa_muc_xam.m` — so sánh 2, 4, 16 và 256 mức xám.
4. `lab04_aliasing_va_nyquist.m` — minh họa lấy mẫu thiếu trên mẫu sọc tần số cao.
5. `lab05_ket_hop_lay_mau_luong_tu.m` — thay đổi đồng thời độ phân giải không gian và mức xám.
6. `lab06_rgb_hsv_va_cac_kenh.m` — xem RGB/HSV, brightness, hue và saturation.

Mỗi lab có file `loigiai_lab...m` tham khảo. `uniform_quantize.m` là hàm lượng tử hóa dùng trong ví dụ. Mở file lab trong MATLAB rồi nhấn **Run**. Ảnh mẫu được đọc từ thư mục `matlab/data`; script tự tìm đường dẫn.
