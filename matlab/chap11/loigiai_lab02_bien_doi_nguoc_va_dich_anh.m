%% LOI GIAI LAB 2 - IFFT VA TINH CHAT DICH
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
J=real(ifft2(fft2(I))); K=circshift(I,[40 25]);
F1=fftshift(fft2(I)); F2=fftshift(fft2(K));
fprintf('Reconstruction error %g; magnitude difference %g\n',max(abs(I(:)-J(:))),max(abs(abs(F1(:))-abs(F2(:)))));
figure; subplot(1,3,1); imshow(I); title('Original');
subplot(1,3,2); imshow(J); title('Reconstructed');
subplot(1,3,3); imshow(log(1+abs(F2)),[]); title('Shifted spectrum');
