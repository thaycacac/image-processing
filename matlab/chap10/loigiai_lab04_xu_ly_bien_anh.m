%% LOI GIAI LAB 4 - BORDER HANDLING
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','..','..','Practice','lenna.tif')));
H=fspecial('average',[5 5]);
Z=imfilter(I,H,0,'same'); R=imfilter(I,H,'replicate','same');
S=imfilter(I,H,'symmetric','same'); C=imfilter(I,H,'circular','same');
figure; subplot(2,2,1); imshow(Z); title('Zero');
subplot(2,2,2); imshow(R); title('Replicate');
subplot(2,2,3); imshow(S); title('Symmetric');
subplot(2,2,4); imshow(C); title('Circular');
