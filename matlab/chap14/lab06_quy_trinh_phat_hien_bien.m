%% LAB 6 - QUY TRINH PHAT HIEN BIEN TREN ANH NHIEU
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','cameraman2.tif')));
if ndims(I)==3, I=rgb2gray(I); end
N=imnoise(I,'gaussian',0,0.004); smooth=imgaussfilt(N,1.2);
raw=edge(N,'canny'); pre=edge(smooth,'canny'); sob=edge(smooth,'sobel');
figure('Name','Lab 6 - Edge detection workflow');
subplot(2,3,1); imshow(I,[]); title('Anh goc');
subplot(2,3,2); imshow(N,[]); title('Anh co nhieu');
subplot(2,3,3); imshow(smooth,[]); title('Gaussian smoothing');
subplot(2,3,4); imshow(raw); title('Canny truc tiep');
subplot(2,3,5); imshow(pre); title('Canny sau lam tron');
subplot(2,3,6); imshow(sob); title('Sobel sau lam tron');
