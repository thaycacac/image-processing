%% LOI GIAI LAB 6 - SLIDING, STRETCHING, SHRINKING
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','..','..','Practice','lenna.tif')));
J1=min(I+.2,1); J2=imadjust(I,[.2 .8],[0 1]); J3=imadjust(I,[0 1],[.25 .75]);
figure; subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(J1); title('Slide brighter');
subplot(2,2,3); imshow(J2); title('Stretch');
subplot(2,2,4); imshow(J3); title('Shrink');
