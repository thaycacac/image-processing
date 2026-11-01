%% LOI GIAI LAB 1 - CONG ANH VA TRAN SO
clear; close all; clc;
X = uint8([200 100 100;0 10 50;50 250 120]);
Y = uint8([100 220 230;45 95 120;205 100 0]);
Zclip = imadd(X,Y); W = uint16(X)+uint16(Y);
Znorm = uint8(255*double(W-min(W(:)))/double(max(W(:))-min(W(:))));
disp(Zclip); disp(W); disp(Znorm);
figure; subplot(1,3,1); imshow(X); title('X');
subplot(1,3,2); imshow(Y); title('Y');
subplot(1,3,3); imshow(Zclip); title('Saturated sum');
