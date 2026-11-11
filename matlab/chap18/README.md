# Chương 18 — Trích chọn và biểu diễn đặc trưng

Trích chọn đặc trưng chuyển ảnh hoặc đối tượng đã phân đoạn thành các đại lượng số gọn hơn để mô tả hình dạng, mức xám và kết cấu. Vector đặc trưng có thể dùng về sau cho phân loại hoặc nhận dạng; đặc trưng tốt cần phù hợp mục tiêu và ổn định trước các biến đổi không mong muốn.

## Kiến thức cần nhớ

- `regionprops` đo diện tích, tâm, chu vi, trục, độ lệch tâm, hộp bao và các thuộc tính vùng khác.
- Một số đại lượng như diện tích và chu vi đổi theo tỷ lệ; tỷ số như circularity và eccentricity có thể ít nhạy với tịnh tiến/tỷ lệ hơn.
- Chain code biểu diễn hướng đi dọc biên; sai phân mã và chuẩn hóa điểm bắt đầu giúp giảm ảnh hưởng quay và điểm bắt đầu.
- Fourier descriptor biến biên thành dãy số phức; giữ một số hệ số tần số thấp cho phép xấp xỉ hình dạng bằng biểu diễn ngắn.
- Histogram cung cấp trung bình, độ lệch chuẩn, độ lệch, năng lượng và entropy nhưng bỏ qua vị trí pixel.
- GLCM mô tả quan hệ mức xám giữa các cặp pixel ở khoảng cách/hướng xác định. Contrast, correlation, energy và homogeneity phụ thuộc lượng tử hóa và hướng.
- Các bài cần Image Processing Toolbox; GLCM dùng `graycomatrix` và `graycoprops`.

## Các lab

1. `lab01_dac_trung_vung_nhi_phan.m` — đo đặc trưng hình dạng và tạo vector đặc trưng.
2. `lab02_bat_bien_hinh_dang.m` — so sánh đặc trưng trước/sau tịnh tiến, quay và co giãn.
3. `lab03_chain_code_va_signature.m` — mã Freeman, shape number và chữ ký biên.
4. `lab04_fourier_descriptor.m` — tái tạo đường biên với số hệ số Fourier khác nhau.
5. `lab05_dac_trung_histogram.m` — thống kê histogram trên toàn ảnh và vùng quan tâm.
6. `lab06_dac_trung_ket_cau_glcm.m` — tính đặc trưng GLCM theo vùng và hướng.

Mỗi bài có file `loigiai_...m` đi kèm. Ảnh mẫu `shapes23.png`, `cameraman2.tif` và `rice.png` nằm trong `matlab/data` cùng repo.
