%% LOI GIAI LAB 6 - QUY TRINH PHAT HIEN BIEN TREN ANH NHIEU
clear; close all; clc; rng(0);
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','cameraman2.tif')));
if ndims(I)==3, I=rgb2gray(I); end
N=imnoise(I,'gaussian',0,0.004); F=imgaussfilt(N,1.2);
figure('Name','Solution 6 - Edge workflow');
subplot(2,3,1); imshow(I,[]); title('Original');
subplot(2,3,2); imshow(N,[]); title('Noisy');
subplot(2,3,3); imshow(F,[]); title('Gaussian smoothed');
subplot(2,3,4); imshow(edge(N,'canny')); title('Canny raw');
subplot(2,3,5); imshow(edge(F,'canny')); title('Canny smoothed');
subplot(2,3,6); imshow(edge(F,'sobel')); title('Sobel smoothed');
