# Chương 4 — Image Processing Toolbox

Chương này giới thiệu các thao tác MATLAB/Image Processing Toolbox để đọc thông tin ảnh, nạp ảnh, đổi kiểu dữ liệu, hiển thị, khảo sát pixel và ghi ảnh ra tệp. Các lab dùng ảnh mẫu `Practice/lenna.tif` (xám) và `Practice/statue.png` (RGB) trong thư mục môn học; mỗi script tự tìm ảnh từ vị trí của chính nó.

## Kiến thức cần nhớ

### Đọc thông tin và nạp ảnh

- `imfinfo(filename)` đọc metadata như kích thước, định dạng, bit depth và dung lượng tệp.
- `imread(filename)` đọc dữ liệu ảnh vào MATLAB. Kết quả có thể là ma trận ảnh xám, mảng RGB, hoặc dữ liệu indexed cùng colormap.
- `size(I)` cho biết kích thước mảng; `class(I)` cho biết kiểu dữ liệu.

### Kiểu dữ liệu ảnh

- `uint8`: số nguyên 8-bit, thường có miền 0–255.
- `double`: số thực; theo quy ước ảnh của IPT thường chuẩn hóa về [0,1]. Dùng `im2double(I)` để chuyển đổi ảnh.
- `logical`: hai giá trị `false`/`true`, thường biểu diễn đen/trắng hoặc mask.
- `double(I)` chỉ đổi kiểu số, không tự chia giá trị uint8 cho 255. Với ảnh uint8, dùng `im2double(I)` khi cần chuẩn hóa.
- Hàm thường gặp: `im2double`, `im2uint8`, `im2single`, `rgb2gray`, `gray2ind`, `ind2rgb`, `ind2gray`, `mat2gray`.

### Hiển thị ảnh

- `imshow(I)` hiển thị theo quy ước kiểu ảnh.
- `imshow(I,[])` tự đặt cửa sổ hiển thị từ giá trị nhỏ nhất đến lớn nhất trong ảnh.
- `imshow(I,[low high])` ánh xạ dải chỉ định vào dải hiển thị; hữu ích khi muốn xem một khoảng cường độ.
- `imagesc(I)` co giãn dữ liệu theo colormap hiện tại; khác với cách `imshow` diễn giải kiểu ảnh.
- `image(I)` dùng colormap hiện tại; `imtool(I)` mở công cụ tương tác để khảo sát ảnh (cần IPT).

### Khảo sát và ghi ảnh

- Đọc pixel theo chỉ số `I(row,column)`; với ảnh RGB, thêm chỉ số kênh: `I(row,column,channel)`.
- `impixel(I,x,y)` lấy pixel tại tọa độ đồ họa `(x,y)`; `x` là cột và `y` là hàng.
- `improfile(I,x,y)` lấy cường độ dọc theo đường qua các tọa độ đã cho.
- `imwrite(I,filename)` ghi ảnh. JPEG nhận tham số như `imwrite(I,'out.jpg','Quality',90)`; JPEG nén mất dữ liệu.

## Các lab đã giải

1. `lab01_thong_tin_va_doc_anh.m` — `imfinfo`, `imread`, kích thước và kiểu dữ liệu.
2. `lab02_hien_thi_anh.m` — so sánh `imshow`, dải hiển thị và `imagesc`.
3. `lab03_chuyen_doi_kieu_anh.m` — `double` so với `im2double`, chuyển đổi ảnh.
4. `lab04_rgb_sang_xam.m` — kênh RGB và chuyển ảnh màu sang xám.
5. `lab05_khao_sat_pixel.m` — đọc pixel và lấy profile dọc đường.
6. `lab06_luu_anh.m` — ghi PNG/JPEG, kiểm tra metadata và dung lượng tệp.

Mỗi lab có file `loigiai_lab...m` tương ứng. Mở file lab trong MATLAB rồi nhấn **Run**. Các bài dùng hàm IPT như `imread`, `imshow`, `im2double`, `rgb2gray`, `impixel` và `improfile`.
