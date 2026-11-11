%% LOI GIAI LAB 4 - GLOBAL VA LOCAL EQUALIZATION
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','lenna.tif'));
Jg=histeq(I); Jl=adapthisteq(I,'ClipLimit',.01,'NumTiles',[8 8]);
figure; subplot(1,3,1); imshow(I); title('Original');
subplot(1,3,2); imshow(Jg); title('Global');
subplot(1,3,3); imshow(Jl); title('Local CLAHE');
