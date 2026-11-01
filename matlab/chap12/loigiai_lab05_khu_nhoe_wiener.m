%% LOI GIAI LAB 5 - WIENER DEBLUR
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','..','..','Practice','lenna.tif')));
psf=fspecial('motion',15,20); B=imfilter(I,psf,'conv','circular');
v=.0002; N=imnoise(B,'gaussian',0,v); J=deconvwnr(N,psf,v/var(I(:)));
J=min(max(J,0),1);
figure; subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(B); title('Blurred'); subplot(2,2,3); imshow(N); title('Noisy');
subplot(2,2,4); imshow(J); title('Wiener restored');
