%% LAB 5 - ANH HUONG CUTOFF VA BAC BUTTERWORTH
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif')));
[M,N] = size(I); [U,V] = meshgrid(1:N,1:M);
D = sqrt((U-(floor(N/2)+1)).^2 + (V-(floor(M/2)+1)).^2);
Fc = fftshift(fft2(I));
orders = [1 2 5]; D0 = 30;

figure('Name','Lab 5 - Butterworth order');
for k = 1:numel(orders)
    n = orders(k);
    H = 1 ./ (1 + (D./D0).^(2*n));
    J = real(ifft2(ifftshift(Fc.*H)));
    subplot(2,3,k); imshow(H,[]); title(sprintf('Mask order n=%d',n));
    subplot(2,3,k+3); imshow(J,[]); title(sprintf('Output n=%d',n));
end
% Tang n lam chuyen tiep quanh D0 sac hon va gan Ideal hon.

% Thay D0 = 15 hoac 60 de thay vung thong qua hep/roeng ra.
