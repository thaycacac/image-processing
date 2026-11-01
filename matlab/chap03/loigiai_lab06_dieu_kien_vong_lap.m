%% LOI GIAI LAB 6 - DIEU KIEN VA VONG LAP
clear; clc;
v = [12 5 18 7 20 3];
for k = 1:numel(v)
    if mod(v(k),2) == 0
        fprintf('%d la so chan\n', v(k));
    else
        fprintf('%d la so le\n', v(k));
    end
end

tong = 0;
for k = 1:100
    tong = tong + k;
end
fprintf('Tong 1 den 100 = %d\n', tong); % 5050

anh = uint8([0 50 130; 200 127 255]);
soPixelSang = sum(anh(:) >= 128); % 3
fprintf('So pixel >= 128: %d\n', soPixelSang);

n = 0;
while 2^n <= 1000
    n = n + 1;
end
fprintf('n nho nhat sao cho 2^n > 1000 la %d\n', n); % 10
