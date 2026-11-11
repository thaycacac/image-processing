# Chương 17 — Nén và mã hóa ảnh

Nén ảnh giảm lượng dữ liệu cần lưu hoặc truyền. Mã hóa không mất dữ liệu cho phép khôi phục chính xác ảnh gốc; mã hóa mất dữ liệu giảm kích thước mạnh hơn bằng cách loại bỏ thông tin ít nhìn thấy. Chất lượng và kích thước tệp cần được đánh giá cùng nhau.

## Kiến thức cần nhớ

- Dư thừa không gian xuất hiện khi các pixel lân cận giống nhau; histogram và entropy gợi ý khả năng nén thống kê nhưng không quyết định chính xác kích thước tệp.
- PNG là định dạng lossless; JPEG là định dạng lossy. Tỷ lệ nén có thể tính bằng kích thước gốc chia kích thước sau nén.
- RLE thay các chuỗi giá trị lặp bằng cặp (giá trị, độ dài); hiệu quả với vùng phẳng/ảnh nhị phân nhưng có thể làm dữ liệu ảnh tự nhiên lớn hơn.
- JPEG biến đổi các khối 8×8 bằng DCT rồi lượng tử hóa hệ số; lượng tử hóa mạnh hơn giảm kích thước nhưng tăng sai số và khối hóa.
- MSE đo sai số bình phương trung bình; PSNR đổi MSE sang thang dB. SSIM so sánh cấu trúc cảm nhận. Không một chỉ số đơn lẻ nào thay thế hoàn toàn việc quan sát ảnh.
- Đọc/ghi ảnh dùng MATLAB cơ bản; `ssim`, `dct2` và `idct2` cần Image Processing Toolbox.

## Các lab

1. `lab01_kich_thuoc_va_ty_le_nen.m` — so sánh dung lượng ảnh và tỷ lệ nén.
2. `lab02_entropy_va_du_thua.m` — histogram, entropy và dự đoán dư thừa thống kê.
3. `lab03_ma_hoa_run_length.m` — mã hóa/giải mã RLE trên ảnh nhị phân.
4. `lab04_jpeg_va_chat_luong.m` — tác động của JPEG quality lên PSNR/SSIM.
5. `lab05_dct_va_luong_tu_hoa.m` — minh họa DCT khối và lượng tử hóa kiểu JPEG.
6. `lab06_so_sanh_phuong_phap_nen.m` — so sánh PNG và JPEG theo dung lượng, sai số và chất lượng.

Mỗi bài có file `loigiai_...m` đi kèm. Ảnh mẫu `lenna.tif` nằm trong `matlab/data` cùng repo. Các tệp kết quả được ghi vào `chap17/output/`.
