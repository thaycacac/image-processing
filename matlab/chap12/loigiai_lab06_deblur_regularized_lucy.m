%% LOI GIAI LAB 6 - REGULARIZED VA LUCY-RICHARDSON
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','..','..','Practice','lenna.tif')));
P=fspecial('gaussian',[9 9],1.5); B=imfilter(I,P,'conv','symmetric');
R=deconvreg(B,P); L=deconvlucy(B,P,15);
R=min(max(R,0),1); L=min(max(L,0),1);
figure; subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(B); title('Blurred');
subplot(2,2,3); imshow(R); title('Regularized');
subplot(2,2,4); imshow(L); title('Lucy-Richardson');
