%% LOI GIAI LAB 6 - UNSHARP VA HIGH-BOOST
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
B=imfilter(I,fspecial('gaussian',[9 9],1.5),'replicate');
U=min(max(I+(I-B),0),1); H=min(max(1.7*I-B,0),1);
figure; subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(B); title('Blur');
subplot(2,2,3); imshow(U); title('Unsharp');
subplot(2,2,4); imshow(H); title('High boost');
