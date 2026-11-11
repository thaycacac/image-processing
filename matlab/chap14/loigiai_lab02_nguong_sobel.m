%% LOI GIAI LAB 2 - SOBEL VA NGUONG
clear; close all; clc; rng(0);
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','cameraman2.tif')));
if ndims(I)==3, I=rgb2gray(I); end
N=imnoise(I,'gaussian',0,0.003); T=[0.03 0.08 0.15];
figure('Name','Solution 2 - Sobel thresholds');
subplot(2,2,1); imshow(N,[]); title('Noisy input');
for k=1:3, subplot(2,2,k+1); imshow(edge(N,'sobel',T(k))); title(sprintf('Sobel T=%.2f',T(k))); end
