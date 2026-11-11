%% LAB 3 - CAC BO LOC KHONG GIAN KHU NHIEU
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));
Inoise = imnoise(I,'salt & pepper',0.05);
W = ones(3,3)/9;

% Arithmetic mean: trung binh cong trong cua so 3x3.
Jarith = imfilter(Inoise,W,'symmetric');
% Cac mean nhan/cac mean phi tuyen can so duong, nen day pixel 0 len 1e-3.
Ipos = max(Inoise,1e-3);
Jgeom = exp(imfilter(log(Ipos),W,'symmetric'));
Jharm = 1 ./ imfilter(1./Ipos,W,'symmetric');
Q = 1; % Q>0 tang trong so pixel sang va co ich de giam pepper noise.
Jcontra = imfilter(Ipos.^(Q+1),W,'symmetric') ./ imfilter(Ipos.^Q,W,'symmetric');
Jmedian = medfilt2(Inoise,[3 3]);

figure('Name','Lab 3 - Spatial denoising filters');
subplot(2,3,1); imshow(I); title('Anh goc');
subplot(2,3,2); imshow(Inoise); title('Salt-and-pepper');
subplot(2,3,3); imshow(Jarith); title('Arithmetic mean');
subplot(2,3,4); imshow(Jgeom); title('Geometric mean');
subplot(2,3,5); imshow(Jharm); title('Harmonic mean');
subplot(2,3,6); imshow(Jmedian); title('Median 3x3');
fprintf('MAE noisy %.4f, arithmetic %.4f, median %.4f, contra(Q=1) %.4f\n', ...
    mean(abs(Inoise(:)-I(:))),mean(abs(Jarith(:)-I(:))), ...
    mean(abs(Jmedian(:)-I(:))),mean(abs(Jcontra(:)-I(:))));
% Contraharmonic Q=1 chi hien thi rieng de thay tac dong len outlier toi.
figure('Name','Contraharmonic mean');
subplot(1,2,1); imshow(Inoise); title('Noisy');
subplot(1,2,2); imshow(Jcontra); title('Contraharmonic Q=1');
