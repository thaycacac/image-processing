%% LAB 4 - ALIASING VA NGUYEN TAC NYQUIST
clear; close all; clc;
% Tao mau vach den-trang co tan so khong gian cao.
N = 256; [x,~] = meshgrid(0:N-1,0:N-1);
period = 8;
pattern = 0.5 + 0.5*cos(2*pi*x/period);
P2 = pattern(1:2:end,1:2:end);
P4 = pattern(1:4:end,1:4:end);
P8 = pattern(1:8:end,1:8:end);
figure('Name','Lab 4 - Aliasing');
subplot(2,2,1); imshow(pattern); title('Mau goc');
subplot(2,2,2); imshow(P2); title('Lay mau buoc 2');
subplot(2,2,3); imshow(P4); title('Lay mau buoc 4');
subplot(2,2,4); imshow(P8); title('Lay mau buoc 8: aliasing ro');
% Lay mau qua tho lam hoa tan mau nhanh thanh tan so gia; loc truoc downsample de giam aliasing.
