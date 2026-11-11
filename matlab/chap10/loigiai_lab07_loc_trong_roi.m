%% LOI GIAI LAB 7 - LOC ROI
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
[r,c]=size(I); [x,y]=meshgrid(1:c,1:r);
BW=((x-c/2)/(c*.28)).^2+((y-r/2)/(r*.35)).^2<=1;
H=fspecial('gaussian',[9 9],1.5); J=roifilt2(H,I,BW);
figure; subplot(1,3,1); imshow(I); title('Original');
subplot(1,3,2); imshow(BW); title('ROI mask');
subplot(1,3,3); imshow(J); title('Filtered inside ROI');
