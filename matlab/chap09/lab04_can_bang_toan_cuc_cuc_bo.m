%% LAB 4 - CAN BANG TOAN CUC VA CUC BO (CLAHE)
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif'));

% histeq dung thong ke toan bo anh de tao mot phep anh xa chung.
Jglobal = histeq(I);
% adapthisteq can bang theo cac tile cuc bo va gioi han clip de han che tang nhieu.
Jlocal = adapthisteq(I,'ClipLimit',0.01,'NumTiles',[8 8]);

figure('Name','Lab 4 - Global va local');
subplot(2,3,1); imshow(I); title('Anh goc');
subplot(2,3,2); imshow(Jglobal); title('histeq - toan cuc');
subplot(2,3,3); imshow(Jlocal); title('adapthisteq - cuc bo');
subplot(2,3,4); imhist(I); title('Histogram goc');
subplot(2,3,5); imhist(Jglobal); title('Histogram global');
subplot(2,3,6); imhist(Jlocal); title('Histogram local');
% CLAHE co the lam chi tiet cuc bo ro hon, nhung neu clip limit cao co the lam nhiu ro.
