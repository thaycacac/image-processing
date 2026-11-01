%% CHUONG 2 - GOI Y LOI GIAI
% Chay tung section (Ctrl+Enter) hoac chay ca file.

clear; close all; clc;

%% Bai 1
I = uint8([0 40 80 120; ...
           30 70 110 150; ...
           60 100 140 180; ...
           90 130 190 255]);
p = I(2,3);                  % p = 110
fprintf('I co kich thuoc %d x %d, kieu %s, I(2,3)=%d\n', ...
    size(I,1), size(I,2), class(I), p);
figure('Name','Loi giai 1');
imagesc(I); axis image; colormap gray; colorbar;
title('Anh xam: moi phan tu ma tran la mot pixel');

%% Bai 2
I2 = [10 80 130 240; 50 160 200 30; 90 100 220 170];
B = I2 >= 128;
disp('Anh nhi phan B (1 neu pixel >= 128):');
disp(B);

%% Bai 3
R = uint8(zeros(60, 80));
G = uint8(zeros(60, 80));
Bblue = uint8(zeros(60, 80));
R(10:50, 10:30) = 255;
G(10:50, 31:55) = 180;
Bblue(10:50, 56:75) = 255;
RGB = cat(3, R, G, Bblue);
greenAt2040 = RGB(20,40,2); % 180
fprintf('RGB co kich thuoc %s; kenh green tai (20,40) = %d\n', ...
    mat2str(size(RGB)), greenAt2040);
figure('Name','Loi giai 3'); image(RGB); axis image;
title('RGB: kich thuoc cao x rong x 3');

%% Bai 4
% Lan can 4: tren, duoi, trai, phai quanh tam (3,3).
N4 = false(5,5);
N4(2,3) = true; N4(4,3) = true;
N4(3,2) = true; N4(3,4) = true;
% Lan can 8 them bon o cheo.
N8 = N4;
N8(2,2) = true; N8(2,4) = true;
N8(4,2) = true; N8(4,4) = true;
figure('Name','Loi giai 4');
subplot(1,2,1); imagesc(N4); axis image; colorbar; title('Lan can 4');
subplot(1,2,2); imagesc(N8); axis image; colorbar; title('Lan can 8');

%% Bai 5
X = logical([1 0; 0 1]);
% Theo 4-lien thong: 2 thanh phan rieng.
% Theo 8-lien thong: 1 thanh phan, vi hai pixel ke nhau theo duong cheo.
fprintf(['Ma tran X co 2 pixel foreground. Chung tao 2 vung theo 4-lien thong ' ...
         'va 1 vung theo 8-lien thong.\n']);
figure('Name','Loi giai 5'); imagesc(X); axis image; colormap gray;
title('Hai pixel chi cham nhau tai goc');

%% Bai 6
fprintf(['P1: phep diem; P2: phep lan can; ' ...
         'P3: ket hop hai anh/ma tran; P4: bien doi mien Fourier.\n']);

%% Ghi nho
% RGB(:,:,1) = kenh do, RGB(:,:,2) = kenh luc, RGB(:,:,3) = kenh lam.
% JPEG thuong nen mat du lieu; PNG thuong nen khong mat du lieu.
% Loai anh (binary/grayscale/RGB/indexed) khac voi dinh dang tep (JPEG/PNG...).
