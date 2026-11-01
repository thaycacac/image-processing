%% LOI GIAI LAB 2 - KIEU DU LIEU VA CHUYEN DOI
clear; clc;
x = [0 1.7 12.9 260];
fprintf('Kieu ban dau: %s\n', class(x));
x8 = uint8(x);               % Gia tri duoc lam tron va gioi han trong mien uint8.
mask = x > 10;               % [false false true true]
x01 = double(x) / 255;       % Luu y: 260/255 lon hon 1.
disp('x8 ='); disp(x8);
disp('mask ='); disp(mask);
disp('x01 ='); disp(x01);
fprintf('Kieu x8: %s; kieu mask: %s\n', class(x8), class(mask));
