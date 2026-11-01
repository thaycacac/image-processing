%% LOI GIAI LAB 2 - TRU ANH VA ANH AM
clear; close all; clc;
X = uint8([200 100 100;0 10 50;50 250 120]);
Y = uint8([100 220 230;45 95 120;205 100 0]);
disp(imsubtract(X,Y)); disp(imsubtract(Y,X));
disp(imabsdiff(X,Y)); disp(imcomplement(X));
figure; subplot(1,3,1); imshow(X); title('X');
subplot(1,3,2); imshow(imabsdiff(X,Y)); title('Absolute difference');
subplot(1,3,3); imshow(imcomplement(X)); title('Negative');
