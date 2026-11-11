%% LAB 4 - CANNY, NGUONG KEP VA DO LECH CHUAN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','cameraman2.tif')));
if ndims(I)==3, I=rgb2gray(I); end
N=imnoise(I,'gaussian',0,0.002);
figure('Name','Lab 4 - Canny parameters'); subplot(2,2,1); imshow(N,[]); title('Anh co nhieu');
subplot(2,2,2); imshow(edge(N,'canny')); title('Canny mac dinh');
subplot(2,2,3); imshow(edge(N,'canny',[0.05 0.15],1)); title('Nguong [0.05 0.15], sigma=1');
subplot(2,2,4); imshow(edge(N,'canny',[0.10 0.25],2)); title('Nguong [0.10 0.25], sigma=2');
% Nguong duoi chi xac dinh bien yeu neu lien thong voi bien manh.
