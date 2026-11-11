%% LAB 6 - SO SANH CAC PHUONG PHAP PHAN DOAN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','rice.png')));
if ndims(I)==3, I=rgb2gray(I); end
T=graythresh(I); globalBW=imbinarize(I,T);
localT=adaptthresh(I,.48,'NeighborhoodSize',51,'ForegroundPolarity','bright'); localBW=imbinarize(I,localT);
BW=globalBW; if mean(BW(:))>.5, BW=~BW; end
BW=bwareaopen(BW,15); D=bwdist(~BW); D(~BW)=-Inf; L=watershed(-D); waterBW=BW; waterBW(L==0)=0;
figure('Name','Lab 6 - Segmentation comparison');
subplot(2,2,1); imshow(I,[]); title('Anh goc');
subplot(2,2,2); imshow(globalBW); title('Otsu toan cuc');
subplot(2,2,3); imshow(localBW); title('Nguong thich nghi');
subplot(2,2,4); imshow(waterBW); title('Watershed sau Otsu');
fprintf('Nguong Otsu=%.4f; pixel foreground global/local/watershed=%d/%d/%d\n',T,nnz(globalBW),nnz(localBW),nnz(waterBW));
