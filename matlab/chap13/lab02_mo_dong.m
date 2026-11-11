%% LAB 2 - PHEP MO VA DONG
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
se3=strel('disk',2,0); se7=strel('disk',4,0);
opened=imopen(BW,se3); closed=imclose(BW,se3);
figure('Name','Lab 2 - Opening and closing');
subplot(2,3,1); imshow(BW); title('Goc');
subplot(2,3,2); imshow(opened); title('Mo, disk r=2');
subplot(2,3,3); imshow(closed); title('Dong, disk r=2');
subplot(2,3,4); imshow(imopen(BW,se7)); title('Mo, disk r=4');
subplot(2,3,5); imshow(imclose(BW,se7)); title('Dong, disk r=4');
subplot(2,3,6); imshowpair(BW,opened,'montage'); title('Goc va sau phep mo');
% Thu thay doi ban kinh SE va nhan xet chi tiet nao bi mat/duoc noi lai.
