%% LOI GIAI LAB 4 - HPF VA EMPHASIS
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','..','..','Practice','lenna.tif')));
[M,N]=size(I); [u,v]=meshgrid(1:N,1:M); D=sqrt((u-(floor(N/2)+1)).^2+(v-(floor(M/2)+1)).^2);
L=exp(-D.^2/(2*25^2)); H=1-L; E=.6+1.4*H; F=fftshift(fft2(I));
J=real(ifft2(ifftshift(F.*H))); K=min(max(real(ifft2(ifftshift(F.*E))),0),1);
figure; subplot(1,3,1); imshow(I); title('Original');
subplot(1,3,2); imshow(J,[]); title('High pass');
subplot(1,3,3); imshow(K); title('High-frequency emphasis');
