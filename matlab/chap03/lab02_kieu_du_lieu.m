%% LAB 2 - KIEU DU LIEU VA CHUYEN DOI
clear; clc;
x = [0 1.7 12.9 260];

% class cho biet kieu du lieu; so thap phan mac dinh thuong la double.
fprintf('Kieu ban dau cua x: %s\n', class(x));

% uint8 la so nguyen khong dau 8-bit; gia tri duoc lam tron va gioi han 0..255.
x8 = uint8(x);

% Phep so sanh tra ve mang logical true/false cung kich thuoc voi x.
mask = x > 10;

% Chuyen sang double truoc khi chia de tinh tren so thuc.
% Chia 255 dua pixel 8-bit ve mien [0,1]; 260/255 se lon hon 1.
x01 = double(x) / 255;

disp('x ban dau:'); disp(x);
disp('x sau khi chuyen uint8:'); disp(x8);
disp('Mask x > 10:'); disp(mask);
disp('x chia cho 255:'); disp(x01);
fprintf('Kieu x8: %s; kieu mask: %s\n', class(x8), class(mask));
