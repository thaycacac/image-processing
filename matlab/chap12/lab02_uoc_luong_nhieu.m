%% LAB 2 - UOC LUONG NHIEU TU VUNG PHANG
clear; close all; clc;
rng(1); % Co dinh seed de so lieu lap lai giua cac lan chay.

% Vung phang muc xam 0.5, chi co nhieu Gaussian voi mean 0 va sigma 0.06.
patch = 0.5 + 0.06*randn(256,256);
patch = min(max(patch,0),1);
muEstimate = mean(patch(:));
sigmaEstimate = std(patch(:));
fprintf('Uoc luong mean=%.4f; sigma=%.4f (gia tri tao sigma=0.06).\n', ...
    muEstimate,sigmaEstimate);

% So sanh histogram vung phang Gaussian voi mask nhiễu muối tiêu.
sp = imnoise(0.5*ones(256,256),'salt & pepper',0.08);
figure('Name','Lab 2 - Noise estimation');
subplot(2,2,1); imshow(patch); title('Patch + Gaussian');
subplot(2,2,2); imhist(patch); title('Histogram Gaussian');
subplot(2,2,3); imshow(sp); title('Patch + salt-and-pepper');
subplot(2,2,4); imhist(sp); title('Histogram impulse');
% Gaussian tao phan bo quanh gia tri nen; impulse tao cac dem lon o hai dau mien.
