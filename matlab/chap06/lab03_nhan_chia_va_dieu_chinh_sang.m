%% LAB 3 - NHAN, CHIA VA DIEU CHINH DO SANG
clear; close all; clc;
I = uint8([0 40 80; 120 180 240; 255 100 20]);
I01 = im2double(I);

% Nhan voi he so <1 lam anh toi; he so >1 lam anh sang hon.
Idim = immultiply(I01, 0.5);
Ibright = min(immultiply(I01, 1.5), 1); % cat ve mien hien thi [0,1]

% Chia tung pixel cho mang mau so. Khong chia cho 0: thay mau so 0 bang eps.
denominator = [1 2 4; 2 3 5; 4 5 0];
safeDenominator = denominator;
safeDenominator(safeDenominator == 0) = eps;
Idiv = imdivide(I01, safeDenominator);

disp('Anh sau khi chia theo tung pixel:'); disp(Idiv);
figure('Name','Lab 3 - Nhan chia');
subplot(1,3,1); imshow(I); title('Anh goc');
subplot(1,3,2); imshow(Idim); title('Nhan 0.5');
subplot(1,3,3); imshow(Ibright); title('Nhan 1.5, cat ve 1');
