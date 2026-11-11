%% LAB 2 - CAC CACH HIEN THI ANH
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', 'data', 'lenna.tif'));
% lenna.tif da la anh xam 1 kenh; rgb2gray chi dung cho anh RGB.
if size(I,3) == 3, Igray = rgb2gray(I); else, Igray = I; end

% imshow(uint8) dung mien mac dinh; [] tu chon min/max.
% Doi so [low high] giup xem rieng mot khoang muc xam.
figure('Name','Lab 2 - So sanh hien thi');
subplot(2,2,1); imshow(Igray); title('imshow(Igray)');
subplot(2,2,2); imshow(Igray,[]); title('imshow(Igray,[])');
subplot(2,2,3); imshow(Igray,[80 170]); title('imshow(Igray,[80 170])');

% imagesc scale du lieu vao colormap hien tai; colorbar hien thang gia tri.
subplot(2,2,4); imagesc(Igray); axis image; colormap gray; colorbar;
title('imagesc(Igray)');
fprintf('Pixel goc tai (100,100): %d\n', Igray(100,100));
