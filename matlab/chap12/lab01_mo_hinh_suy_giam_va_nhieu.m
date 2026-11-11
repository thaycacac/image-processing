%% LAB 1 - MO HINH SUY GIAM VA CAC LOAI NHIEU
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));

% Tao blur bang PSF Gaussian, sau do cong nhieu Gaussian: g = h*f + n.
psf = fspecial('gaussian',[9 9],1.5);
blurred = imfilter(I,psf,'replicate');
gaussianNoise = imnoise(I,'gaussian',0,0.01);
impulseNoise = imnoise(I,'salt & pepper',0.04);
uniformN = 0.12*(rand(size(I))-0.5);
uniformNoise = min(max(I+uniformN,0),1);

figure('Name','Lab 1 - Degradation and noise');
subplot(2,3,1); imshow(I); title('Anh goc f');
subplot(2,3,2); imshow(blurred); title('Nhòe h*f');
subplot(2,3,3); imshow(gaussianNoise); title('Gaussian noise');
subplot(2,3,4); imshow(impulseNoise); title('Salt-and-pepper');
subplot(2,3,5); imshow(uniformNoise); title('Uniform additive noise');
subplot(2,3,6); imshow(gaussianNoise-I,[]); title('Mau nhieu Gaussian');
% Biet dang suy giam (blur/noise) giup chon bo loc phuc hoi phu hop.
