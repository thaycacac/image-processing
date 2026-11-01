%% LAB 4 - CONG NHIEU GAUSSIAN
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif')));

% Nhiu Gaussian co trung binh 0; sigma dieu khien do manh cua nhiu.
sigma = 0.08;
noise = sigma * randn(size(I));
InoisyRaw = I + noise;
% Gia tri co the vuot [0,1]; cat ve mien hop le de hien thi/luu anh.
Inoisy = min(max(InoisyRaw,0),1);

fprintf('Anh goc: min %.3f, max %.3f\n', min(I(:)), max(I(:)));
fprintf('Anh sau cong nhieu truoc clipping: min %.3f, max %.3f\n', ...
    min(InoisyRaw(:)), max(InoisyRaw(:)));
fprintf('Anh sau clipping: min %.3f, max %.3f\n', min(Inoisy(:)), max(Inoisy(:)));
figure('Name','Lab 4 - Nhieu cong');
subplot(1,3,1); imshow(I); title('Anh goc');
subplot(1,3,2); imshow(noise,[]); title('Mat na nhieu (scale hien thi)');
subplot(1,3,3); imshow(Inoisy); title('Anh + nhieu Gaussian');
