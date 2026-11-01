%% LOI GIAI LAB 1 - FFT VA PHO
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','..','..','Practice','lenna.tif')));
F=fftshift(fft2(I));
figure; subplot(1,3,1); imshow(I); title('Spatial image');
subplot(1,3,2); imshow(log(1+abs(F)),[]); title('Log magnitude');
subplot(1,3,3); imshow(angle(F),[]); title('Phase');
