%% LOI GIAI LAB 3 - XOAY ANH
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','statue.png'));
Jloose=imrotate(I,30,'bilinear','loose');
Jcrop=imrotate(I,30,'bilinear','crop');
figure; subplot(1,3,1); imshow(I); title('Original');
subplot(1,3,2); imshow(Jloose); title('Loose');
subplot(1,3,3); imshow(Jcrop); title('Crop');
