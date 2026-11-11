%% LOI GIAI LAB 2 - MEAN VA GAUSSIAN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
A=imfilter(I,fspecial('average',[3 3]),'replicate');
G=imfilter(I,fspecial('gaussian',[7 7],1.2),'replicate');
figure; subplot(1,3,1); imshow(I); title('Original');
subplot(1,3,2); imshow(A); title('Mean');
subplot(1,3,3); imshow(G); title('Gaussian');
