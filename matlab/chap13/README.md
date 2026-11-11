# Chương 13 — Xử lý ảnh hình thái

Hình thái toán học dùng phần tử cấu trúc (structuring element, SE) để khảo sát hình dạng và cấu trúc không gian của ảnh. Chương này tập trung vào ảnh nhị phân, một số thuật toán hình thái cơ bản và mở rộng sang ảnh mức xám.

## Kiến thức cần nhớ

- SE xác định lân cận và hình học của phép toán; cả hình dạng lẫn kích thước SE đều ảnh hưởng kết quả. `strel` tạo các SE như `square`, `disk`, `diamond`, `line`.
- Giãn (`imdilate`) làm vùng tiền cảnh nở ra; co (`imerode`) làm vùng co lại.
- Mở (`imopen`) là co rồi giãn, thường loại vật thể nhỏ/nét nhô; đóng (`imclose`) là giãn rồi co, thường lấp khe hẹp và lỗ nhỏ.
- Biên trong có thể tính bằng `A - erode(A)`; gradient hình thái là hiệu giữa ảnh giãn và ảnh co.
- Tô vùng kín lặp phép giãn có giới hạn bởi phần bù của ảnh: `Xk = (Xk-1 ⊕ B) ∩ Ac`. `bwconncomp`/`bwlabel` tìm các thành phần liên thông.
- Trên ảnh mức xám, giãn và co thay cực đại/cực tiểu cục bộ. Top-hat trắng lấy chi tiết sáng nhỏ hơn SE; bottom-hat lấy chi tiết tối.
- Phần lớn hàm như `strel`, `imdilate`, `imopen`, `imfill`, `bwconncomp`, `imtophat` cần Image Processing Toolbox.

## Các lab

1. `lab01_se_gian_co.m` — thử SE khác nhau với giãn và co ảnh nhị phân.
2. `lab02_mo_dong.m` — so sánh mở, đóng và tác động của kích thước SE.
3. `lab03_trich_xuat_bien.m` — biên trong, biên ngoài và gradient hình thái.
4. `lab04_to_vung_va_thanh_phan.m` — tô lỗ, gắn nhãn và đo thành phần liên thông.
5. `lab05_hinh_thai_muc_xam.m` — giãn, co, mở, đóng và top-hat/bottom-hat mức xám.
6. `lab06_lam_sach_anh_nhi_phan.m` — quy trình làm sạch ảnh nhị phân với nhiễu và vật thể nhỏ.

Mỗi bài có file `loigiai_...m` đi kèm. Các bài 1–4 và 6 dùng `data/shapes23.png`; bài 5 dùng ảnh mức xám `data/rice.png`. Các ảnh mẫu đã được đóng gói trong `matlab/data`, nên có thể chạy sau khi clone riêng repo này.
