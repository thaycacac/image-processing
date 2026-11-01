# Chương 9 — Xử lý histogram

Histogram ảnh xám là phân bố tần suất của các mức xám. Đây là mô tả thống kê hữu ích để phân tích và cải thiện tương phản, nhưng không chứa vị trí không gian của pixel.

## Kiến thức cần nhớ

- Histogram `h(k)` đếm số pixel có mức xám `k`; histogram chuẩn hóa chia số đếm cho tổng pixel để biểu diễn xác suất.
- Histogram lệch trái thường gợi ý ảnh tối; lệch phải thường gợi ý ảnh sáng; dải hẹp thường gợi ý tương phản thấp. Hãy xem ảnh cùng histogram vì histogram không cho biết cấu trúc/vị trí pixel.
- Histogram tích lũy (CDF) là tổng tích lũy của histogram chuẩn hóa. Cân bằng histogram ánh xạ mức xám qua CDF để phân bố đầu ra trải rộng hơn.
- `histeq(I)` cân bằng toàn cục; `adapthisteq(I)` cân bằng cục bộ theo vùng (CLAHE), thường tăng chi tiết cục bộ nhưng có thể làm nhiễu nổi rõ hơn.
- Khớp histogram tìm ánh xạ để phân bố mức xám nguồn gần với phân bố ảnh tham chiếu; MATLAB có `imhistmatch`.
- Sliding cộng/trừ offset để dịch độ sáng. Stretching mở rộng dải đầu vào; shrinking ánh xạ ảnh vào dải hẹp hơn.
- Hàm IPT thường dùng: `imhist`, `histeq`, `adapthisteq`, `imhistmatch`, `imadjust`.

## Các lab đã giải

1. `lab01_tinh_histogram.m` — histogram đếm tay và `imhist`.
2. `lab02_doc_hieu_histogram.m` — so sánh ảnh tối/sáng/tương phản thấp và giới hạn của histogram.
3. `lab03_can_bang_histogram.m` — cân bằng thủ công qua CDF và so với `histeq`.
4. `lab04_can_bang_toan_cuc_cuc_bo.m` — `histeq` và `adapthisteq`.
5. `lab05_khop_histogram.m` — khớp phân bố với ảnh tham chiếu.
6. `lab06_dich_keo_gian_thu_hep.m` — sliding, stretching và shrinking.

Mỗi lab có file `loigiai_lab...m` tham khảo. Ảnh mẫu nằm trong `Practice`; script tự dựng đường dẫn. Mở file lab trong MATLAB rồi nhấn **Run**; cần Image Processing Toolbox.
