%% LOI GIAI LAB 1 - SUY GIAM VA NHIEU
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
B=imfilter(I,fspecial('gaussian',[9 9],1.5),'replicate');
G=imnoise(I,'gaussian',0,.01); S=imnoise(I,'salt & pepper',.04);
U=min(max(I+.12*(rand(size(I))-.5),0),1);
figure; subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(B); title('Blurred');
subplot(2,2,3); imshow(G); title('Gaussian noise');
subplot(2,2,4); imshow(S); title('Impulse noise');
