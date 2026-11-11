%% LOI GIAI LAB 1 - BIEN DOI TUYEN TINH
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
c=1.4; b=.08; J=min(max(c*I+b,0),1);
figure; subplot(1,2,1); imshow(I); title('Original');
subplot(1,2,2); imshow(J); title('Contrast and brightness');
