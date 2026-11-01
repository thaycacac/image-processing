# Chương 12 — Khôi phục ảnh

Khôi phục ảnh tìm cách ước lượng ảnh gốc từ ảnh đã suy giảm. Mô hình thường dùng là `g = h*f + n`: ảnh gốc `f` bị nhòe bởi hàm suy giảm/PSF `h`, sau đó có thể cộng nhiễu `n`. Muốn khôi phục tốt cần biết hoặc ước lượng kiểu suy giảm.

## Kiến thức cần nhớ

- Nhiễu thường gặp: Gaussian, muối tiêu (impulse), uniform, Rayleigh, Gamma/Erlang và exponential. Nên ước lượng loại nhiễu cùng tham số trước khi chọn bộ lọc.
- Có thể khảo sát một vùng phẳng của ảnh: nhiễu Gaussian tạo phân bố gần chuông; muối tiêu tạo các giá trị cực đen/trắng; nhiễu tuần hoàn thường hiện thành cặp đỉnh trong phổ Fourier.
- Lọc không gian: arithmetic/geometric/harmonic/contraharmonic mean và median. Median thường hiệu quả với impulse; mean thường giảm nhiễu Gaussian nhưng làm mờ chi tiết.
- Nhiễu tuần hoàn có thể xử lý trong miền tần số bằng bandreject (chặn dải tần) hoặc bandpass (giữ dải tần). Chọn dải quá rộng sẽ làm mất chi tiết ảnh.
- Khử nhòe dùng PSF/degradation function. Inverse filtering nhạy với nhiễu; Wiener cân bằng sai số phục hồi và nhiễu; regularized và Lucy–Richardson là lựa chọn khác.
- Các hàm IPT: `imnoise`, `medfilt2`, `imfilter`, `fft2`, `deconvwnr`, `deconvreg`, `deconvlucy`.

## Các lab đã giải

1. `lab01_mo_hinh_suy_giam_va_nhieu.m` — mô hình suy giảm và các loại nhiễu thường gặp.
2. `lab02_uoc_luong_nhieu.m` — ước lượng trung bình/độ lệch chuẩn và nhận diện nhiễu qua histogram.
3. `lab03_loc_khu_nhieu_khong_gian.m` — mean, geometric, harmonic, contraharmonic và median.
4. `lab04_nhieu_tuan_hoan_bandreject.m` — loại nhiễu tuần hoàn bằng bandreject trong miền Fourier.
5. `lab05_khu_nhoe_wiener.m` — khử nhòe có nhiễu bằng Wiener filter.
6. `lab06_deblur_regularized_lucy.m` — so sánh regularized và Lucy–Richardson.

Mỗi lab có file lời giải tham khảo. Ảnh mẫu `Practice/lenna.tif` được dựng đường dẫn theo vị trí script. Các hàm phục hồi cần Image Processing Toolbox.
