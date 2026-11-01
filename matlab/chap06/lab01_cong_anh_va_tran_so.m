%% LAB 1 - CONG ANH, TRON ANH VA TRAN SO
clear; close all; clc;
X = uint8([200 100 100; 0 10 50; 50 250 120]);
Y = uint8([100 220 230; 45 95 120; 205 100 0]);

% imadd tren uint8 gioi han gia tri vuot 255 ve 255 (saturation/clipping).
Zclip = imadd(X,Y);
% Cong trong kieu rong giu duoc tong toi da 510, chua mat thong tin tran.
W = uint16(X) + uint16(Y);
% Chuan hoa min-max ve 0..255 de hien thi tong trong kieu uint8.
Znorm = uint8(255 * double(W - min(W(:))) / double(max(W(:))-min(W(:))));

% Tron hai anh double theo trong so: 60% X va 40% Y.
X01 = im2double(X); Y01 = im2double(Y);
Zblend = 0.6 * X01 + 0.4 * Y01;

disp('X + Y bang imadd (bi bao hoa o 255):'); disp(Zclip);
disp('Tong giu trong uint16:'); disp(W);
disp('Tong sau chuan hoa min-max:'); disp(Znorm);
fprintf('Vi du pixel tron (1,1): %.3f\n', Zblend(1,1));
figure('Name','Lab 1 - Cong anh');
subplot(1,3,1); imshow(X); title('X');
subplot(1,3,2); imshow(Y); title('Y');
subplot(1,3,3); imshow(Zclip); title('imadd: clipping');
