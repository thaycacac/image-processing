%% LAB 3 - SO SANH IDEAL, BUTTERWORTH VA GAUSSIAN LPF
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));
[M,N] = size(I); [U,V] = meshgrid(1:N,1:M);
centerX = floor(N/2)+1; centerY = floor(M/2)+1;
D = sqrt((U-centerX).^2 + (V-centerY).^2);
D0 = 35; order = 2;

% Ideal co bien cat cung; Butterworth va Gaussian chuyen tiep mem hon.
Hideal = double(D <= D0);
Hbutter = 1 ./ (1 + (D./D0).^(2*order));
Hgauss = exp(-(D.^2)/(2*D0^2));
Fc = fftshift(fft2(I));
Jideal = real(ifft2(ifftshift(Fc.*Hideal)));
Jbutter = real(ifft2(ifftshift(Fc.*Hbutter)));
Jgauss = real(ifft2(ifftshift(Fc.*Hgauss)));

figure('Name','Lab 3 - Low-pass filters');
subplot(2,3,1); imshow(Hideal,[]); title('Ideal LPF');
subplot(2,3,2); imshow(Hbutter,[]); title('Butterworth LPF');
subplot(2,3,3); imshow(Hgauss,[]); title('Gaussian LPF');
subplot(2,3,4); imshow(Jideal,[]); title('Anh sau Ideal');
subplot(2,3,5); imshow(Jbutter,[]); title('Anh sau Butterworth');
subplot(2,3,6); imshow(Jgauss,[]); title('Anh sau Gaussian');
% Ideal co cat dot ngot co the tao ringing; Gaussian co chuyen tiep tron nhat.
