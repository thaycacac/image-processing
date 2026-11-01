%% LOI GIAI LAB 3 - MEDIAN FILTER
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','..','..','Practice','lenna.tif')));
N=imnoise(I,'salt & pepper',.05);
M=medfilt2(N,[3 3]); A=imfilter(N,fspecial('average',[3 3]),'replicate');
figure; subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(N); title('Noisy');
subplot(2,2,3); imshow(M); title('Median');
subplot(2,2,4); imshow(A); title('Mean');
