%% LAB 4 - CAN BANG HISTOGRAM ANH MAU
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','statue.png')));
if ndims(I)==2, I=repmat(I,1,1,3); end
Y=rgb2ycbcr(I); Yeq=Y; Yeq(:,:,1)=histeq(Y(:,:,1));
Yclahe=Y; Yclahe(:,:,1)=adapthisteq(Y(:,:,1));
eqRGB=ycbcr2rgb(Yeq); claheRGB=ycbcr2rgb(Yclahe);
gray=rgb2gray(I); grayEq=histeq(gray);
figure('Name','Lab 4 - Color histogram equalization');
subplot(2,3,1); imshow(I); title('Goc');
subplot(2,3,2); imshow(eqRGB); title('Can bang kenh Y');
subplot(2,3,3); imshow(claheRGB); title('CLAHE kenh Y');
subplot(2,3,4); imhist(Y(:,:,1)); title('Histogram Y truoc');
subplot(2,3,5); imhist(Yeq(:,:,1)); title('Histogram Y sau histeq');
subplot(2,3,6); imshow(grayEq,[]); title('Histeq anh xam');
% So sanh voi can bang rieng tung kenh RGB va quan sat bien doi mau.
