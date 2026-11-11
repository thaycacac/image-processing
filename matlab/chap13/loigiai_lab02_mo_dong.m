%% LOI GIAI LAB 2 - PHEP MO VA DONG
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
seSmall=strel('disk',2,0); seLarge=strel('disk',4,0);
figure('Name','Solution 2 - Opening and closing');
subplot(2,3,1); imshow(BW); title('Goc');
subplot(2,3,2); imshow(imopen(BW,seSmall)); title('Mo r=2');
subplot(2,3,3); imshow(imclose(BW,seSmall)); title('Dong r=2');
subplot(2,3,4); imshow(imopen(BW,seLarge)); title('Mo r=4');
subplot(2,3,5); imshow(imclose(BW,seLarge)); title('Dong r=4');
subplot(2,3,6); imshow(imopen(imclose(BW,seSmall),seSmall)); title('Dong roi mo');
