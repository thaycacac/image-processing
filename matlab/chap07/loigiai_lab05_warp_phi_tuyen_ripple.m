%% LOI GIAI LAB 5 - WARP RIPPLE
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(rgb2gray(imread(fullfile(scriptDir,'..','..','..','Practice','statue.png'))));
[r,c]=size(I); [X,Y]=meshgrid(1:c,1:r);
Xsrc=X+8*sin(2*pi*Y/110); Ysrc=Y+8*sin(2*pi*X/90);
J=interp2(I,Xsrc,Ysrc,'linear',0);
figure; subplot(1,2,1); imshow(I); title('Original');
subplot(1,2,2); imshow(J); title('Ripple inverse map');
