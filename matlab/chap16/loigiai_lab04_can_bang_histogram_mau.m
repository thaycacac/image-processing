%% LOI GIAI LAB 4 - CAN BANG HISTOGRAM ANH MAU
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','statue.png')));
if ndims(I)==2, I=repmat(I,1,1,3); end
Y=rgb2ycbcr(I); Y1=Y; Y2=Y;
Y1(:,:,1)=histeq(Y(:,:,1)); Y2(:,:,1)=adapthisteq(Y(:,:,1));
J1=ycbcr2rgb(Y1); J2=ycbcr2rgb(Y2); G=rgb2gray(I); G1=histeq(G);
figure('Name','Solution 4 - Histogram processing');
subplot(2,3,1); imshow(I); title('Original');
subplot(2,3,2); imshow(J1); title('Equalized Y');
subplot(2,3,3); imshow(J2); title('Adaptive equalization Y');
subplot(2,3,4); imhist(Y(:,:,1)); title('Original Y histogram');
subplot(2,3,5); imhist(Y1(:,:,1)); title('Equalized Y histogram');
subplot(2,3,6); imshow(G1,[]); title('Equalized grayscale');
