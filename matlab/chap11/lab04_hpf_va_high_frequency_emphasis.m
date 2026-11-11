%% LAB 4 - HPF VA HIGH-FREQUENCY EMPHASIS
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));
[M,N] = size(I); [U,V] = meshgrid(1:N,1:M);
D = sqrt((U-(floor(N/2)+1)).^2 + (V-(floor(M/2)+1)).^2);
D0 = 25;

% Gaussian LPF va HPF bo sung nhau, nen Hhp = 1-Hlp.
Hlp = exp(-(D.^2)/(2*D0^2));
Hhp = 1 - Hlp;
% High-frequency emphasis giu mot phan tan so thap (a) va tang tan so cao (b).
a = 0.6; b = 1.4;
Hemphasis = a + b*Hhp;
Fc = fftshift(fft2(I));
Jhigh = real(ifft2(ifftshift(Fc.*Hhp)));
Jemphasis = real(ifft2(ifftshift(Fc.*Hemphasis)));
Jemphasis = min(max(Jemphasis,0),1);

figure('Name','Lab 4 - High-pass');
subplot(2,2,1); imshow(Hhp,[]); title('Gaussian HPF');
subplot(2,2,2); imshow(Jhigh,[]); title('HPF response (edges/details)');
subplot(2,2,3); imshow(I); title('Anh goc');
subplot(2,2,4); imshow(Jemphasis); title('High-frequency emphasis');
% HPF don thuan co the co gia tri am; imshow(Jhigh,[]) tu scale chi de xem.
