%% LOI GIAI LAB 6 - ROI BANG MASK
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif')));
[r,c] = size(I); [x,y] = meshgrid(1:c,1:r);
mask = x>=round(c*.25)&x<=round(c*.75)&y>=round(r*.25)&y<=round(r*.75);
roiOnly = immultiply(I,double(mask));
J = I; J(mask)=min(J(mask)+.25,1);
figure; subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(mask); title('ROI mask');
subplot(2,2,3); imshow(roiOnly); title('ROI only');
subplot(2,2,4); imshow(J); title('Brightened ROI');
