%% LOI GIAI LAB 3 - CAN BANG HISTOGRAM
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','lenna.tif'));
h=imhist(I,256); cdf=cumsum(h)/numel(I);
map=uint8(round(255*cdf)); J=reshape(map(double(I)+1),size(I));
figure; subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imhist(I); title('Before');
subplot(2,2,3); imshow(J); title('CDF equalized');
subplot(2,2,4); imhist(J); title('After');
