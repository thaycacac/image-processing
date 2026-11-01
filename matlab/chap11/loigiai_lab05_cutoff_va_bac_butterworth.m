%% LOI GIAI LAB 5 - BAC BUTTERWORTH
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','..','..','Practice','lenna.tif')));
[M,N]=size(I); [u,v]=meshgrid(1:N,1:M); D=sqrt((u-(floor(N/2)+1)).^2+(v-(floor(M/2)+1)).^2);
F=fftshift(fft2(I)); ns=[1 2 5]; figure;
for k=1:3
    H=1./(1+(D/30).^(2*ns(k))); J=real(ifft2(ifftshift(F.*H)));
    subplot(2,3,k); imshow(H,[]); title(sprintf('n=%d mask',ns(k)));
    subplot(2,3,k+3); imshow(J,[]); title(sprintf('n=%d output',ns(k)));
end
