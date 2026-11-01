%% LOI GIAI LAB 3 - LOG TRANSFORM
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','..','..','Practice','lenna.tif')));
c=20; J=log(1+c*I)/log(1+c);
figure; subplot(1,2,1); imshow(I); title('Original');
subplot(1,2,2); imshow(J); title('Log mapping');
