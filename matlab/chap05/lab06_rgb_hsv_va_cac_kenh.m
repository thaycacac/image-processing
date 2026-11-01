%% LAB 6 - MAU RGB, HSV VA CAC THANH PHAN
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'statue.png')));
% HSV tach thong tin mau H, do bao hoa S va do sang V.
HSV = rgb2hsv(I);
H = HSV(:,:,1); S = HSV(:,:,2); V = HSV(:,:,3);
figure('Name','Lab 6 - RGB va HSV');
subplot(2,2,1); imshow(I); title('Anh RGB');
subplot(2,2,2); imshow(H,[]); title('Hue H');
subplot(2,2,3); imshow(S,[]); title('Saturation S');
subplot(2,2,4); imshow(V,[]); title('Value / brightness V');
fprintf('H = sac do, S = do bao hoa, V = do sang.\n');
fprintf('RGB la cach ma hoa mau theo ba kenh do-luc-lam.\n');
