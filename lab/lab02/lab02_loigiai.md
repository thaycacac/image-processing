# Lab 02 — Nhận dạng mẫu

## 1. Một hệ thống nhận dạng gồm các bước xử lý nào?

Một hệ thống nhận dạng mẫu thường có chuỗi xử lý sau:

1. **Thu nhận dữ liệu:** lấy ảnh từ camera, máy quét hoặc tệp.
2. **Tiền xử lý:** chuyển ảnh về dạng thuận tiện (ví dụ ảnh xám), khử nhiễu, cân bằng sáng, chuẩn hóa kích thước và căn chỉnh vị trí.
3. **Phân đoạn:** tách đối tượng cần nhận dạng khỏi nền. Với ảnh chữ số, bước này tạo mặt nạ chỉ chứa nét chữ.
4. **Trích chọn đặc trưng:** chuyển đối tượng thành các số mô tả, chẳng hạn tỷ lệ chiều rộng/chiều cao, diện tích nét, số lỗ, histogram chiếu hoặc pixel của ảnh đã chuẩn hóa.
5. **Phân lớp/ra quyết định:** so sánh vector đặc trưng với các mẫu đã học và gán nhãn (ở đây là 0 hoặc 1).
6. **Đánh giá và hậu xử lý:** kiểm tra độ chính xác trên dữ liệu chưa dùng để huấn luyện, xử lý trường hợp không chắc chắn và đưa ra kết quả.

Trong quá trình xây dựng hệ thống, dữ liệu có nhãn được chia thành tập huấn luyện, xác thực và kiểm tra. Tập huấn luyện dùng để học mô hình; tập xác thực hỗ trợ chọn tham số; tập kiểm tra chỉ dùng để ước lượng khả năng nhận dạng trên mẫu mới.

## 2. Làm thế nào để huấn luyện máy học theo các mẫu?

1. Thu thập nhiều ví dụ đại diện cho từng lớp và gắn nhãn đúng cho từng ví dụ.
2. Tiền xử lý tất cả ảnh theo cùng một quy tắc để giảm khác biệt không liên quan như kích thước, vị trí, độ sáng và nhiễu.
3. Trích xuất cùng một bộ đặc trưng cho mỗi ảnh; mỗi ảnh trở thành một vector số `x`, còn nhãn lớp là `y`.
4. Chia dữ liệu thành tập train/validation/test. Không dùng tập test trong lúc chọn mô hình hoặc tham số.
5. Dùng cặp `(x,y)` của tập train để điều chỉnh mô hình. Ví dụ: lưu tâm lớp, tìm láng giềng gần nhất, hoặc điều chỉnh trọng số của mạng nơ-ron.
6. Chọn tham số bằng tập validation, sau đó đánh giá một lần trên tập test bằng confusion matrix, accuracy, precision, recall và F1.
7. Nếu kết quả chưa tốt, xem các trường hợp nhầm, cải thiện dữ liệu/đặc trưng rồi huấn luyện lại.

Đây là **học có giám sát** vì mỗi mẫu huấn luyện đã có nhãn. Mô hình không chỉ ghi nhớ một ảnh duy nhất: cần nhiều mẫu khác nhau cho mỗi lớp để học được biến thiên thực tế.

## 3. Thuật toán minh họa nhận biết số 0 và số 1

### Ý tưởng

Dùng các ảnh số đã gắn nhãn 0/1. Tiền xử lý mỗi ảnh thành mặt nạ nhị phân, cắt sát chữ, giữ tỷ lệ hình dạng và đưa lên khung chuẩn 32×32. Biểu diễn ảnh đã chuẩn hóa bằng vector pixel. Tạo một số biến thể nhỏ (dịch và quay nhẹ) cho tập train, rồi dùng k láng giềng gần nhất (k-NN) để phân lớp. Lớp được chọn theo đa số láng giềng.

Với chữ số 0, đặc trưng hình dạng thường có một lỗ; chữ số 1 thường hẹp và ít pixel hơn. Có thể bổ sung số lỗ, tỷ lệ khung bao và histogram chiếu để tăng độ bền, nhưng ví dụ dưới đây dùng vector pixel để thuật toán ngắn gọn.

### Giả mã

```text
trainImages = ảnh chữ số đã gắn nhãn 0 hoặc 1
for mỗi ảnh:
    gray = chuyển ảnh sang mức xám
    mask = phân đoạn nét chữ khỏi nền
    mask = cắt sát nét, giữ tỷ lệ và đặt vào khung 32x32
    thêm vector pixel và nhãn vào tập train
    thêm các biến thể dịch/quay nhỏ vào tập train

for mỗi ảnh cần nhận dạng:
    áp dụng cùng tiền xử lý
    tính khoảng cách tới mọi vector train
    lấy k vector có khoảng cách nhỏ nhất
    trả về nhãn chiếm đa số
```

### MATLAB

Chạy `lab02_nhan_dang_so_0_1.m`. Script dùng hai ảnh minh họa `Chapter 19 Classroom.png` (0) và `Chapter 19.png` (1), tạo biến thể để minh họa quy trình huấn luyện, rồi phân lớp lại các ảnh đầu vào bằng k-NN. Hai ảnh này chỉ là mẫu minh họa; để đo độ chính xác thật cần thêm nhiều ảnh độc lập cho mỗi chữ số và dành riêng một tập test.
