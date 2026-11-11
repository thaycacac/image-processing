%% LOI GIAI LAB 3 - LOC KHONG GIAN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
N=imnoise(I,'salt & pepper',.05); W=ones(3,3)/9; P=max(N,1e-3);
A=imfilter(N,W,'symmetric'); G=exp(imfilter(log(P),W,'symmetric'));
H=1./imfilter(1./P,W,'symmetric'); M=medfilt2(N,[3 3]);
C=imfilter(P.^2,W,'symmetric')./imfilter(P,W,'symmetric');
figure; subplot(2,3,1); imshow(I); title('Original');
subplot(2,3,2); imshow(N); title('Noisy'); subplot(2,3,3); imshow(A); title('Arithmetic');
subplot(2,3,4); imshow(G); title('Geometric'); subplot(2,3,5); imshow(H); title('Harmonic');
subplot(2,3,6); imshow(M); title('Median'); figure; imshow(C); title('Contraharmonic Q=1');
