%% LAB 4 - KHU NHIEU TUAN HOAN BANG BANDREJECT
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif')));
[M,N] = size(I); [x,y] = meshgrid(0:N-1,0:M-1);

% Tao nhiu cosinus tuan hoan 24 chu ky theo truc ngang.
periodicNoise = 0.15*cos(2*pi*24*x/N);
Inoise = min(max(I+periodicNoise,0),1);
Fc = fftshift(fft2(Inoise));
[U,V] = meshgrid(1:N,1:M);
D = sqrt((U-(floor(N/2)+1)).^2 + (V-(floor(M/2)+1)).^2);

% Dinh nhieu nam gan ban kinh 24; chan mot dai mong quanh tan so do.
Hreject = double(D < 21 | D > 27);
Hpass = 1 - Hreject;
Jreject = real(ifft2(ifftshift(Fc.*Hreject)));
Jpass = real(ifft2(ifftshift(Fc.*Hpass)));

figure('Name','Lab 4 - Periodic noise');
subplot(2,3,1); imshow(I); title('Anh goc');
subplot(2,3,2); imshow(Inoise); title('Cong nhiu tuan hoan');
subplot(2,3,3); imshow(log(1+abs(Fc)),[]); title('Pho anh co nhiu');
subplot(2,3,4); imshow(Hreject,[]); title('Bandreject mask');
subplot(2,3,5); imshow(min(max(Jreject,0),1)); title('Sau bandreject');
subplot(2,3,6); imshow(Jpass,[]); title('Thanh phan bi loai (bandpass)');
% Dai reject qua rong co the loai ca chi tiet anh cung nam trong vung tan so do.
