# Chương 2 — Cơ sở xử lý ảnh

Bộ tài liệu này giúp ôn cách ảnh số được biểu diễn, khái niệm lân cận/liên thông và các nhóm phép xử lý ảnh cơ bản. Ví dụ dùng MATLAB cơ bản; hiển thị bằng `imagesc` nên không bắt buộc có Image Processing Toolbox.

## Thứ tự học

1. Đọc phần ghi nhớ dưới đây.
2. Mở và chạy riêng từng file `bai01_...m` đến `bai06_...m`; tự làm các mục có `TODO`.
3. Chạy `chap02_solutions.m` để xem cách làm tham khảo.

Mỗi bài là một script độc lập. Mở file mong muốn trong MATLAB rồi nhấn **Run**, hoặc gọi tên file (không có phần mở rộng `.m`) trong Command Window khi thư mục hiện tại là `chap02`.

## Nội dung cần nắm

### Biểu diễn ảnh

- Ảnh raster/bitmap là lưới pixel, lưu thành ma trận hoặc mảng. Phóng lớn có thể thấy pixel và ảnh bị vỡ.
- Ảnh vector lưu mô tả hình học như đường và vùng; thay đổi kích thước thuận tiện, nhưng khi hiển thị phải raster hóa.
- Ảnh nhị phân thường có hai giá trị `0` và `1`.
- Ảnh xám 8-bit thường có mức sáng `0–255` (`0` đen, `255` trắng). Ảnh xám kiểu `double` thường được chuẩn hóa về `[0,1]`.
- Ảnh RGB có ba kênh đỏ, lục, lam; kích thước thường là `cao × rộng × 3`.
- Ảnh indexed lưu chỉ số màu trong ma trận và màu thật trong bảng màu (colormap).

### Định dạng và nén

- JPEG thường dùng nén mất dữ liệu; PNG thường dùng nén không mất dữ liệu; GIF dùng bảng màu tối đa 256 màu; BMP thường lưu raster đơn giản; TIFF hỗ trợ nhiều cách lưu/nén.
- Phân biệt **định dạng tệp** với **kiểu dữ liệu trong bộ nhớ**: JPEG là định dạng, còn `uint8` là kiểu dữ liệu MATLAB.

### Lân cận, kề và liên thông

Với pixel tại `(r,c)`, lân cận 4 gồm trên, dưới, trái, phải. Lân cận chéo gồm bốn góc; lân cận 8 gồm lân cận 4 và chéo. Hai pixel cùng giá trị chỉ được xem là kề nếu quan hệ kề đã chọn cho phép nối chúng. Một đường đi gồm chuỗi pixel kề nhau; các pixel nối được bằng đường đi thuộc cùng thành phần liên thông.

Chọn 4-liên thông hay 8-liên thông có thể làm thay đổi số vùng/vật thể. Hai pixel chỉ chạm góc tách rời theo 4-liên thông nhưng nối nhau theo 8-liên thông.

### Nhóm phép xử lý ảnh

- **Phép điểm:** đầu ra tại một vị trí chỉ phụ thuộc pixel đầu vào tương ứng, ví dụ đổi độ sáng.
- **Phép lân cận:** đầu ra phụ thuộc pixel và vùng xung quanh, ví dụ làm mờ bằng trung bình.
- **Kết hợp nhiều ảnh:** ví dụ cộng/trừ ảnh hoặc dùng mask.
- **Miền biến đổi:** biến đổi biểu diễn ảnh (ví dụ Fourier), xử lý trong miền mới rồi có thể biến đổi ngược.

## Mục tiêu tự kiểm tra

- Nêu được khác nhau giữa ảnh nhị phân, xám, RGB và indexed.
- Đọc được `size`, `class`, giá trị pixel của một ma trận ảnh.
- Vẽ/đếm lân cận 4 và 8; giải thích ảnh hưởng đến liên thông.
- Phân loại được phép điểm, lân cận, kết hợp ảnh và miền biến đổi.
- Giải thích JPEG nén mất dữ liệu khác PNG nén không mất dữ liệu thế nào.
