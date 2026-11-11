%% LAB 3 - XOAY ANH
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', 'data', 'statue.png'));

% imrotate xoay nguoc chieu kim dong ho; mac dinh mo rong khung de giu toan anh.
I30 = imrotate(I,30,'bilinear','loose');
% 'crop' giu kich thuoc khung ban dau, nen cac goc co the bi cat.
I30crop = imrotate(I,30,'bilinear','crop');
fprintf('Goc: %s; loose: %s; crop: %s\n', ...
    mat2str(size(I)),mat2str(size(I30)),mat2str(size(I30crop)));

figure('Name','Lab 3 - Xoay anh');
subplot(1,3,1); imshow(I); title('Goc');
subplot(1,3,2); imshow(I30); title('30 deg, loose');
subplot(1,3,3); imshow(I30crop); title('30 deg, crop');
