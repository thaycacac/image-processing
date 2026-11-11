%% LAB 5 - KHU NHOE BANG WIENER FILTER
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));

% Tao nhieu motion blur voi PSF da biet, dung boundary circular de mo hinh don gian.
psf = fspecial('motion',15,20);
blurred = imfilter(I,psf,'conv','circular');
noiseVariance = 0.0002;
observed = imnoise(blurred,'gaussian',0,noiseVariance);

% Wiener filter can bang PSF voi muc nhieu; NSR la noise-to-signal ratio.
NSR = noiseVariance / var(I(:));
restored = deconvwnr(observed,psf,NSR);
restored = min(max(restored,0),1);
fprintf('NSR su dung: %.6f\n',NSR);
fprintf('MAE blurred/noisy %.4f; Wiener %.4f\n', ...
    mean(abs(observed(:)-I(:))),mean(abs(restored(:)-I(:))));

figure('Name','Lab 5 - Wiener restoration');
subplot(2,2,1); imshow(I); title('Anh goc');
subplot(2,2,2); imshow(blurred); title('Motion blur');
subplot(2,2,3); imshow(observed); title('Blur + Gaussian noise');
subplot(2,2,4); imshow(restored); title('Wiener deconvolution');
% PSF sai hoac NSR khong phu hop co the lam ket qua khong tot, tang ringing.
