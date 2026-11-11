%% LAB 3 - MEDIAN FILTER KHU NHIEU MUOI TIEU
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));

% Them nhieu muoi tieu voi mat do 5%.
Inoise = imnoise(I,'salt & pepper',0.05);
% Median la bo loc phi tuyen: sap xep pixel trong cua so roi lay gia tri giua.
Jmedian = medfilt2(Inoise,[3 3]);
% Mean la loc tuyen tinh, nhung cac outlier muoi/tieu keo trung binh lech.
Jmean = imfilter(Inoise,fspecial('average',[3 3]),'replicate');

figure('Name','Lab 3 - Median filter');
subplot(2,2,1); imshow(I); title('Anh goc');
subplot(2,2,2); imshow(Inoise); title('Them salt-and-pepper');
subplot(2,2,3); imshow(Jmedian); title('Median 3x3');
subplot(2,2,4); imshow(Jmean); title('Mean 3x3');
fprintf('MAE noisy %.4f; median %.4f; mean %.4f\n', ...
    mean(abs(Inoise(:)-I(:))),mean(abs(Jmedian(:)-I(:))),mean(abs(Jmean(:)-I(:))));
