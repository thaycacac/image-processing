%% LOI GIAI LAB 4 - BANDREJECT
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
[M,N]=size(I); [x,~]=meshgrid(0:N-1,0:M-1);
In=min(max(I+.15*cos(2*pi*24*x/N),0),1); F=fftshift(fft2(In));
[u,v]=meshgrid(1:N,1:M); D=sqrt((u-(floor(N/2)+1)).^2+(v-(floor(M/2)+1)).^2);
H=double(D<21|D>27); J=real(ifft2(ifftshift(F.*H)));
figure; subplot(1,3,1); imshow(In); title('Noisy');
subplot(1,3,2); imshow(H); title('Bandreject mask');
subplot(1,3,3); imshow(min(max(J,0),1)); title('Filtered');
