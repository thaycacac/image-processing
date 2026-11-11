%% LOI GIAI LAB 5 - HISTOGRAM MATCHING
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','lenna.tif'));
ref=imread(fullfile(scriptDir,'..','data','mri.jpg'));
J=histeq(I,imhist(ref,256));
figure; subplot(2,3,1); imshow(I); title('Source');
subplot(2,3,2); imshow(ref); title('Reference');
subplot(2,3,3); imshow(J); title('Matched');
subplot(2,3,4); imhist(I); subplot(2,3,5); imhist(ref); subplot(2,3,6); imhist(J);
