%% LOI GIAI LAB 3 - LAPLACIAN, LOG VA DOG
clear; close all; clc; rng(0);
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','cameraman2.tif')));
if ndims(I)==3, I=rgb2gray(I); end
N=imnoise(I,'gaussian',0,0.001); h=fspecial('laplacian',0);
L=edge(N,'zerocross',[],h); G=edge(N,'log',0.004,1.5);
DoG=edge(imgaussfilt(N,1)-imgaussfilt(N,2),'zerocross');
figure('Name','Solution 3 - Second-order detectors');
subplot(2,2,1); imshow(N,[]); title('Noisy input');
subplot(2,2,2); imshow(L); title('Laplacian zero-cross');
subplot(2,2,3); imshow(G); title('LoG');
subplot(2,2,4); imshow(DoG); title('DoG');
