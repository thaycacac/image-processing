%% LAB 2 - LAM TRON BANG MEAN VA GAUSSIAN
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));

% Mean filter tinh trung binh deu trong kernel 3x3.
Hmean3 = fspecial('average',[3 3]);
Jmean3 = imfilter(I,Hmean3,'replicate','same');
% Gaussian uu tien pixel gan tam, tham so sigma dieu chinh do rong blur.
Hgauss = fspecial('gaussian',[7 7],1.2);
Jgauss = imfilter(I,Hgauss,'replicate','same');
% Kernel lon hon lam mo manh hon.
Jmean7 = imfilter(I,fspecial('average',[7 7]),'replicate','same');

figure('Name','Lab 2 - Lam tron');
subplot(2,2,1); imshow(I); title('Anh goc');
subplot(2,2,2); imshow(Jmean3); title('Mean 3x3');
subplot(2,2,3); imshow(Jgauss); title('Gaussian 7x7, sigma 1.2');
subplot(2,2,4); imshow(Jmean7); title('Mean 7x7');
