%% LAB 5 - DISTANCE TRANSFORM VA WATERSHED
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','rice.png')));
if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I,graythresh(I)); if mean(BW(:))>.5, BW=~BW; end
BW=bwareaopen(BW,15); D=bwdist(~BW); Dneg=-D; Dneg(~BW)=-Inf;
L=watershed(Dneg); separated=BW; separated(L==0)=0;
figure('Name','Lab 5 - Watershed');
subplot(2,3,1); imshow(I,[]); title('Anh goc');
subplot(2,3,2); imshow(BW); title('Mat na tien canh');
subplot(2,3,3); imshow(D,[]); title('Khoang cach');
subplot(2,3,4); imshow(Dneg,[]); title('Dia hinh am');
subplot(2,3,5); imshow(label2rgb(L,'jet','w','shuffle')); title('Duong phan luu watershed');
subplot(2,3,6); imshow(separated); title('Vat the tach tai duong chia');
