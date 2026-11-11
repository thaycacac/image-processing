%% LOI GIAI LAB 4 - CONG NHIEU GAUSSIAN
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));
sigma = 0.08; noise = sigma*randn(size(I));
InoisyRaw = I + noise; Inoisy = min(max(InoisyRaw,0),1);
figure; subplot(1,3,1); imshow(I); title('Goc');
subplot(1,3,2); imshow(noise,[]); title('Nhieu');
subplot(1,3,3); imshow(Inoisy); title('Anh co nhieu');
