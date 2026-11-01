%% LAB 2 - TRU ANH, SAI KHAC TUYET DOI VA ANH AM
clear; close all; clc;
X = uint8([200 100 100; 0 10 50; 50 250 120]);
Y = uint8([100 220 230; 45 95 120; 205 100 0]);

% imsubtract cat ket qua am ve 0 tren uint8.
XminusY = imsubtract(X,Y);
YminusX = imsubtract(Y,X);
% imabsdiff tinh |X-Y|, nen khong phu thuoc thu tu hai anh.
diffXY = imabsdiff(X,Y);
% Anh am dao den/trang: voi uint8, 255 - moi pixel.
negativeX = imcomplement(X);

disp('X-Y:'); disp(XminusY);
disp('Y-X:'); disp(YminusX);
disp('|X-Y|:'); disp(diffXY);
disp('Anh am cua X:'); disp(negativeX);
figure('Name','Lab 2 - Phep tru');
subplot(2,2,1); imshow(X); title('X');
subplot(2,2,2); imshow(XminusY); title('X-Y, am cat ve 0');
subplot(2,2,3); imshow(diffXY); title('|X-Y|');
subplot(2,2,4); imshow(negativeX); title('Complement X');
