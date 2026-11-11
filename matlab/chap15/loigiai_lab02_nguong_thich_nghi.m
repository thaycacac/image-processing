%% LOI GIAI LAB 2 - NGUONG THICH NGHI
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','rice.png')));
if ndims(I)==3, I=rgb2gray(I); end
[~,w]=size(I); uneven=min(I.*linspace(.55,1.25,w),1);
T=adaptthresh(uneven,.48,'NeighborhoodSize',51,'ForegroundPolarity','bright');
globalBW=imbinarize(uneven,graythresh(uneven)); localBW=imbinarize(uneven,T);
Tsmall=adaptthresh(uneven,.48,'NeighborhoodSize',31,'ForegroundPolarity','bright');
Tlarge=adaptthresh(uneven,.48,'NeighborhoodSize',81,'ForegroundPolarity','bright');
figure('Name','Solution 2 - Adaptive thresholding');
subplot(2,3,1); imshow(uneven,[]); title('Uneven illumination');
subplot(2,3,2); imshow(globalBW); title('Global Otsu');
subplot(2,3,3); imshow(localBW); title('Adaptive 51');
subplot(2,3,4); imshow(imbinarize(uneven,Tsmall)); title('Adaptive 31');
subplot(2,3,5); imshow(imbinarize(uneven,Tlarge)); title('Adaptive 81');
subplot(2,3,6); imshow(T,[]); title('Local threshold map');
