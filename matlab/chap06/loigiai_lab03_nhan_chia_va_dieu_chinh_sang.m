%% LOI GIAI LAB 3 - NHAN VA CHIA ANH
clear; close all; clc;
I = im2double(uint8([0 40 80;120 180 240;255 100 20]));
Idim = immultiply(I,0.5); Ibright = min(immultiply(I,1.5),1);
D = [1 2 4;2 3 5;4 5 0]; D(D==0)=eps;
Idiv = imdivide(I,D); disp(Idiv);
figure; subplot(1,3,1); imshow(I); title('Original');
subplot(1,3,2); imshow(Idim); title('Factor 0.5');
subplot(1,3,3); imshow(Ibright); title('Factor 1.5');
