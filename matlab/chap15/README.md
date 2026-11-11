# Chương 15 — Phân đoạn ảnh

Phân đoạn chia ảnh thành các vùng không chồng lấp, với mục tiêu để mỗi vùng tương ứng với đối tượng, bộ phận hoặc nền có ý nghĩa. Các lab khảo sát phương pháp dựa trên mức xám và histogram, kết nối vùng, phân chia quadtree và watershed.

## Kiến thức cần nhớ

- Ngưỡng toàn cục dùng một ngưỡng `T` cho toàn ảnh. `graythresh` chọn ngưỡng Otsu; kết quả cần kiểm tra vì nền, ánh sáng và nhiễu ảnh hưởng mạnh.
- Ngưỡng thích nghi ước lượng ngưỡng cục bộ, hữu ích khi chiếu sáng không đều. Kích thước vùng lân cận tạo đánh đổi giữa chi tiết cục bộ và ổn định.
- Phát triển vùng dùng seed, tiêu chuẩn tương đồng và kết nối lân cận. `grayconnected` là cách nhanh để lấy vùng liên thông gần mức xám của seed.
- Quadtree chia đệ quy ảnh thành bốn vùng nhỏ hơn cho đến khi mỗi vùng đủ đồng nhất theo tiêu chuẩn đã chọn.
- Watershed xem ảnh như địa hình; khoảng cách (`bwdist`) giúp tách các hạt đụng nhau. Marker và phép biến đổi hình thái giúp hạn chế phân đoạn quá mức.
- Hàm `adaptthresh`, `grayconnected`, `qtdecomp`, `watershed`, `bwdist` và các thao tác nhị phân cần Image Processing Toolbox.

## Các lab

1. `lab01_nguong_toan_cuc_otsu.m` — chọn ngưỡng thủ công, Otsu và kiểm tra histogram.
2. `lab02_nguong_thich_nghi.m` — so sánh ngưỡng toàn cục và cục bộ dưới ánh sáng không đều.
3. `lab03_phat_trien_vung.m` — phát triển vùng từ seed và so sánh độ rộng tiêu chuẩn.
4. `lab04_phan_vung_quadtree.m` — phân chia ảnh bằng quadtree theo độ biến thiên.
5. `lab05_watershed_tach_vat_the.m` — dùng khoảng cách và watershed để tách vật thể chạm nhau.
6. `lab06_so_sanh_phuong_phap.m` — so sánh ngưỡng Otsu, thích nghi và watershed trên ảnh mẫu.

Mỗi bài có file `loigiai_...m` đi kèm. Ảnh mẫu `rice.png` và `cameraman2.tif` nằm trong `matlab/data`; đã được đóng gói cùng repo. Mở script trong MATLAB và nhấn **Run**; các bài cần Image Processing Toolbox.
