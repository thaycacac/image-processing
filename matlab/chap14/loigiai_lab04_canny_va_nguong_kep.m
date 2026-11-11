%% LOI GIAI LAB 4 - CANNY, NGUONG KEP VA DO LECH CHUAN
clear; close all; clc; rng(0);
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','cameraman2.tif')));
if ndims(I)==3, I=rgb2gray(I); end
N=imnoise(I,'gaussian',0,0.002);
E1=edge(N,'canny'); E2=edge(N,'canny',[0.05 0.15],1); E3=edge(N,'canny',[0.10 0.25],2);
figure('Name','Solution 4 - Canny');
subplot(2,2,1); imshow(N,[]); title('Noisy input');
subplot(2,2,2); imshow(E1); title('Default');
subplot(2,2,3); imshow(E2); title('T=[.05 .15], sigma=1');
subplot(2,2,4); imshow(E3); title('T=[.10 .25], sigma=2');
