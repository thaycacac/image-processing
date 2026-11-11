%% LAB 3 - LAPLACIAN, LOG VA DOG
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','cameraman2.tif')));
if ndims(I)==3, I=rgb2gray(I); end
N=imnoise(I,'gaussian',0,0.001);
lap=edge(N,'zerocross',[],fspecial('laplacian',0));
logE=edge(N,'log',0.004,1.5);
g1=imgaussfilt(N,1); g2=imgaussfilt(N,2); dog=edge(g1-g2,'zerocross');
figure('Name','Lab 3 - Laplacian, LoG and DoG');
subplot(2,2,1); imshow(N,[]); title('Anh co nhieu');
subplot(2,2,2); imshow(lap); title('Laplacian zero-cross');
subplot(2,2,3); imshow(logE); title('LoG');
subplot(2,2,4); imshow(dog); title('DoG zero-cross');
