%% LAB 5 - KHOP HISTOGRAM VOI ANH THAM CHIEU
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
source = imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif'));
reference = imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'mri.jpg'));

% Tao histogram muc tieu tu anh reference, sau do histeq map anh source.
targetHistogram = imhist(reference,256);
matched = histeq(source,targetHistogram);

figure('Name','Lab 5 - Histogram matching');
subplot(2,3,1); imshow(source); title('Anh nguon');
subplot(2,3,2); imshow(reference); title('Anh tham chieu');
subplot(2,3,3); imshow(matched); title('Nguon sau khi khop');
subplot(2,3,4); imhist(source); title('Histogram nguon');
subplot(2,3,5); imhist(reference); title('Histogram muc tieu');
subplot(2,3,6); imhist(matched); title('Histogram sau khop');
% Khop histogram lam gan phan bo muc xam, khong lam cho noi dung hinh hoc giong nhau.
