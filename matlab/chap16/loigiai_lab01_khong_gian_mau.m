%% LOI GIAI LAB 1 - CAC KHONG GIAN MAU
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','statue.png')));
if ndims(I)==2, I=repmat(I,1,1,3); end
H=rgb2hsv(I); Y=rgb2ycbcr(I); L=rgb2lab(I);
figure('Name','Solution 1 - Color spaces');
subplot(2,3,1); imshow(I); title('RGB');
subplot(2,3,2); imshow(H(:,:,1),[]); title('Hue');
subplot(2,3,3); imshow(H(:,:,2),[]); title('Saturation');
subplot(2,3,4); imshow(H(:,:,3),[]); title('Value');
subplot(2,3,5); imshow(Y(:,:,1),[]); title('YCbCr luminance');
subplot(2,3,6); imshow(L(:,:,1),[]); title('CIE L*');
