%% LOI GIAI LAB 5 - DISTANCE TRANSFORM VA WATERSHED
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','rice.png')));
if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I,graythresh(I)); if mean(BW(:))>.5, BW=~BW; end
BW=bwareaopen(BW,15); D=bwdist(~BW); topo=-D; topo(~BW)=-Inf;
L=watershed(topo); cut=BW; cut(L==0)=0;
figure('Name','Solution 5 - Watershed');
subplot(2,3,1); imshow(I,[]); title('Original');
subplot(2,3,2); imshow(BW); title('Foreground mask');
subplot(2,3,3); imshow(D,[]); title('Distance transform');
subplot(2,3,4); imshow(topo,[]); title('Inverted distance');
subplot(2,3,5); imshow(label2rgb(L,'jet','w','shuffle')); title('Watershed labels');
subplot(2,3,6); imshow(cut); title('Separated at watershed lines');
