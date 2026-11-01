%% LAB 6 - REGULARIZED VA LUCY-RICHARDSON
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif')));
psf = fspecial('gaussian',[9 9],1.5);
blurred = imfilter(I,psf,'conv','symmetric');

% Deconvolution can PSF da biet, hai cach toi uu khac nhau.
regularized = deconvreg(blurred,psf);
lucy = deconvlucy(blurred,psf,15);
regularized = min(max(regularized,0),1);
lucy = min(max(lucy,0),1);

fprintf('MAE blur %.4f; regularized %.4f; Lucy-Richardson %.4f\n', ...
    mean(abs(blurred(:)-I(:))),mean(abs(regularized(:)-I(:))),mean(abs(lucy(:)-I(:))));
figure('Name','Lab 6 - Deconvolution methods');
subplot(2,2,1); imshow(I); title('Anh goc');
subplot(2,2,2); imshow(blurred); title('Anh bi blur');
subplot(2,2,3); imshow(regularized); title('deconvreg');
subplot(2,2,4); imshow(lucy); title('deconvlucy - 15 iterations');
% Lucy-Richardson nhay voi noise va so vong lap; regularization giup han che dao nhieu.

% Blind deconvolution (PSF khong biet) cua IPT: deconvblind(blurred,PSF0,iterations).
