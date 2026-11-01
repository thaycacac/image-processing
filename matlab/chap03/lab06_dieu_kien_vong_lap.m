%% LAB 6 - DIEU KIEN VA VONG LAP
clear; clc;
v = [12 5 18 7 20 3];

% numel(v) la so phan tu; mod(x,2)==0 kiem tra x chia het cho 2.
for k = 1:numel(v)
    if mod(v(k), 2) == 0
        fprintf('%d la so chan\n', v(k));
    else
        fprintf('%d la so le\n', v(k));
    end
end

% Khoi tao tong truoc vong lap, moi vong cong them mot so.
tong = 0;
for k = 1:100
    tong = tong + k;
end
fprintf('Tong cac so tu 1 den 100 = %d\n', tong);

% So sanh tao mask true/false; sum dem so gia tri true.
anh = uint8([0 50 130; 200 127 255]);
soPixelSang = sum(anh(:) >= 128);
fprintf('So pixel co muc xam >= 128: %d\n', soPixelSang);

% while lap den khi 2^n vuot 1000 thi dieu kien sai va dung.
n = 0;
while 2^n <= 1000
    n = n + 1;
end
fprintf('So nguyen n nho nhat sao cho 2^n > 1000 la %d\n', n);
