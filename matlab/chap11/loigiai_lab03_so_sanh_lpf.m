%% LOI GIAI LAB 3 - LPF
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','..','..','Practice','lenna.tif')));
[M,N]=size(I); [u,v]=meshgrid(1:N,1:M); D=sqrt((u-(floor(N/2)+1)).^2+(v-(floor(M/2)+1)).^2);
D0=35; H1=double(D<=D0); H2=1./(1+(D/D0).^4); H3=exp(-D.^2/(2*D0^2)); F=fftshift(fft2(I));
J1=real(ifft2(ifftshift(F.*H1))); J2=real(ifft2(ifftshift(F.*H2))); J3=real(ifft2(ifftshift(F.*H3)));
figure; subplot(1,3,1); imshow(J1,[]); title('Ideal');
subplot(1,3,2); imshow(J2,[]); title('Butterworth');
subplot(1,3,3); imshow(J3,[]); title('Gaussian');
