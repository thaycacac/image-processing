# Chương 3 — MATLAB cơ bản

Tài liệu Chương 3 gồm phần tóm tắt và 6 lab có lời giải ngay trong code, kèm chú thích giải thích từng bước. Mỗi file `labXX_...m` có thể chạy độc lập trong MATLAB. Các file `loigiai_labXX_...m` là bản tham khảo ngắn gọn.

## Kiến thức cần nắm

### 1. MATLAB làm việc với mảng và ma trận

MATLAB xem một giá trị đơn là ma trận `1×1`; vector và ma trận là các trường hợp của mảng. Với ảnh, ảnh xám thường là ma trận 2D, ảnh RGB thường là mảng 3D.

```matlab
A = [1 2 3; 4 5 6];  % 2 hàng, 3 cột
size(A)               % [2 3]
numel(A)              % 6 phần tử
A(2,3)                % phần tử hàng 2, cột 3
A(1,:)                % hàng thứ nhất
A(:,2)                % cột thứ hai
A(:)                  % trải thành vector cột
```

Chỉ số MATLAB bắt đầu từ **1**. Dấu `:` đại diện cho toàn bộ hàng/cột hoặc một dãy chỉ số.

### 2. Kiểu dữ liệu

- `double`: số thực độ chính xác kép; thường là kiểu mặc định khi tạo số thập phân.
- `single`: số thực độ chính xác đơn.
- `uint8`, `uint16`, `uint32`: số nguyên không dấu; `uint8` thường dùng cho ảnh 8-bit (0–255).
- `int8`, `int16`, `int32`: số nguyên có dấu.
- `logical`: giá trị đúng/sai (`true`/`false`), hữu ích cho mask và điều kiện.
- `char`: dữ liệu ký tự; MATLAB hiện đại cũng có kiểu `string`.

Dùng `class(A)` xem kiểu, `whos` xem biến và dung lượng, `double(A)` hoặc `uint8(A)` để chuyển kiểu. Chuyển kiểu có thể làm tròn hoặc giới hạn giá trị; hãy chú ý miền hợp lệ của kiểu đích.

### 3. Phép toán ma trận và theo từng phần tử

- `A * B`: nhân ma trận; số cột của `A` phải bằng số hàng của `B`.
- `A .* B`: nhân từng phần tử tương ứng; hai mảng cần cùng kích thước hoặc tương thích theo quy tắc mở rộng kích thước của MATLAB.
- Tương tự: `A / B` so với `A ./ B`, và `A ^ n` so với `A .^ n`.
- Cộng/trừ `A + B`, `A - B` thường áp dụng theo vị trí phần tử khi hai mảng tương thích.
- So sánh (`>`, `==`, ...) tạo kết quả `logical`; toán tử logic gồm `&`, `|`, `~`.

Trong xử lý ảnh, phép biến đổi riêng từng pixel thường cần toán tử có dấu chấm như `.*`, `./`, `.^`.

### 4. Tạo mảng và các hàm thường dùng

`zeros(m,n)`, `ones(m,n)`, `true(m,n)`, `false(m,n)`, `eye(n)`, `rand(m,n)`, `randn(m,n)` tạo mảng có cấu trúc hoặc ngẫu nhiên. `sum`, `mean`, `max`, `min` tính theo chiều mặc định; `A(:)` giúp tính trên toàn bộ phần tử.

### 5. Script, function và luồng điều khiển

- **Script** là chuỗi lệnh chạy trong workspace hiện tại, thuận tiện cho một quy trình thực hành.
- **Function** nhận đầu vào và trả đầu ra, có workspace riêng, tiện tái sử dụng và kiểm thử.
- Điều kiện: `if`, `elseif`, `else`, kết thúc bằng `end`.
- Vòng lặp: `for` và `while`, kết thúc bằng `end`.
- Tên file function chính phải trùng tên function.

Ví dụ function lưu trong file `tinhTrungBinh.m`:

```matlab
function tb = tinhTrungBinh(A)
    tb = mean(A(:));
end
```

### 6. Quy trình gỡ lỗi cơ bản

Trước khi tính, xem kích thước và kiểu bằng `size`, `class`, `whos`. Khi kết quả sai, kiểm tra dấu chấm trong phép toán, chỉ số hàng/cột, kích thước mảng, miền giá trị và kiểu dữ liệu.

## Danh sách lab

1. `lab01_vector_ma_tran.m` — tạo mảng, chỉ số và lát cắt.
2. `lab02_kieu_du_lieu.m` — kiểu số, logical và chuyển kiểu.
3. `lab03_phep_toan.m` — nhân ma trận và nhân theo phần tử.
4. `lab04_tao_mang_tinh_toan.m` — hàm tạo mảng, tổng và trung bình.
5. `lab05_script_function.m` — viết function tính trung bình ảnh; chạy demo cùng file `tinh_trung_binh_anh.m`.
6. `lab06_dieu_kien_vong_lap.m` — `if`, `for`, `while` và đếm pixel.

## Cách học

Chạy từng lab để xem kết quả, đọc chú thích theo từng dòng, rồi thử sửa dữ liệu đầu vào để xem kết quả thay đổi thế nào. Các file lab đã có lời giải hoàn chỉnh, không cần điền thêm.
