%% LOI GIAI LAB 6 - SO SANH CAC PHUONG PHAP PHAN DOAN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','rice.png')));
if ndims(I)==3, I=rgb2gray(I); end
T=graythresh(I); G=imbinarize(I,T);
adapt=adaptthresh(I,.48,'NeighborhoodSize',51,'ForegroundPolarity','bright'); A=imbinarize(I,adapt);
BW=G; if mean(BW(:))>.5, BW=~BW; end
BW=bwareaopen(BW,15); D=bwdist(~BW); D(~BW)=-Inf; L=watershed(-D); W=BW; W(L==0)=0;
figure('Name','Solution 6 - Segmentation methods');
subplot(2,2,1); imshow(I,[]); title('Original');
subplot(2,2,2); imshow(G); title(sprintf('Global Otsu T=%.3f',T));
subplot(2,2,3); imshow(A); title('Adaptive threshold');
subplot(2,2,4); imshow(W); title('Watershed split');
fprintf('Foreground pixel counts: global=%d, adaptive=%d, watershed=%d\n',nnz(G),nnz(A),nnz(W));
