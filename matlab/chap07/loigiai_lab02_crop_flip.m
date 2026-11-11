%% LOI GIAI LAB 2 - CROP VA FLIP
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','statue.png'));
Ic=imcrop(I,[80 90 300 300]);
figure; subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(Ic); title('Crop');
subplot(2,2,3); imshow(flipud(I)); title('Vertical flip');
subplot(2,2,4); imshow(fliplr(I)); title('Horizontal flip');
