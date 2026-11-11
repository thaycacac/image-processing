%% LAB 1 - CAC KHONG GIAN MAU
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','statue.png')));
if ndims(I)==2, I=repmat(I,1,1,3); end
HSV=rgb2hsv(I); YCC=rgb2ycbcr(I); Lab=rgb2lab(I);
figure('Name','Lab 1 - Color spaces');
subplot(2,3,1); imshow(I); title('RGB');
subplot(2,3,2); imshow(HSV(:,:,1),[]); title('HSV - Hue');
subplot(2,3,3); imshow(HSV(:,:,2),[]); title('HSV - Saturation');
subplot(2,3,4); imshow(HSV(:,:,3),[]); title('HSV - Value');
subplot(2,3,5); imshow(YCC(:,:,1),[]); title('YCbCr - Y');
subplot(2,3,6); imshow(Lab(:,:,1),[]); title('Lab - L*');
% Kenh H duoc luu theo vong tron [0,1); S, V va L* mang y nghia khac nhau.
