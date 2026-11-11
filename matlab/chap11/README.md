# Chương 11 — Lọc trong miền tần số

Biến đổi Fourier biểu diễn ảnh như tổng các thành phần tần số. Lọc trong miền tần số gồm biến đổi ảnh, nhân phổ với hàm lọc, rồi biến đổi ngược về miền không gian.

## Kiến thức cần nhớ

- `fft2(I)` tính biến đổi Fourier rời rạc 2D; `ifft2(F)` biến đổi ngược. Phổ thường được dịch tâm bằng `fftshift` để tần số thấp nằm giữa ảnh.
- Biên độ phổ `abs(F)` biểu diễn độ mạnh thành phần tần số; pha chứa thông tin vị trí/cấu trúc. Để xem phổ, thường dùng `log(1+abs(F))` vì dải biên độ rất rộng.
- Thành phần tần số thấp tương ứng vùng biến đổi chậm/khá đồng nhất; tần số cao tương ứng chi tiết nhỏ, nhiễu và biên.
- Lọc tần số: `G(u,v)=H(u,v)F(u,v)`; ảnh kết quả `g=real(ifft2(ifftshift(G)))`.
- LPF giữ thấp, giảm cao để làm trơn. HPF giảm thấp, giữ cao để nhấn chi tiết/biên.
- Ideal LPF có ngưỡng cứng; Butterworth chuyển tiếp mềm hơn và có bậc `n`; Gaussian chuyển tiếp trơn, không có gợn do ngưỡng đột ngột.
- High-frequency emphasis giữ một phần tần số thấp và tăng tần số cao: `Hfe = a + b*Hhp`.
- DFT có tính tuyến tính, tuần hoàn, đối xứng liên hợp với ảnh thực, tách được thành hai phép biến đổi 1D; dịch ảnh làm đổi pha phổ nhưng không đổi biên độ.

## Các lab đã giải

1. `lab01_fft_va_pho.m` — FFT 2D, phổ biên độ và phổ log.
2. `lab02_bien_doi_nguoc_va_dich_anh.m` — tái tạo ảnh và tính chất dịch.
3. `lab03_so_sanh_lpf.m` — Ideal, Butterworth và Gaussian LPF.
4. `lab04_hpf_va_high_frequency_emphasis.m` — HPF và high-frequency emphasis.
5. `lab05_cutoff_va_bac_butterworth.m` — ảnh hưởng cutoff và bậc lọc.

Mỗi lab có file lời giải tham khảo. Ảnh mẫu `matlab/data/lenna.tif` được tìm theo vị trí script. Ví dụ dùng FFT có sẵn trong MATLAB; hiển thị ảnh dùng Image Processing Toolbox.
