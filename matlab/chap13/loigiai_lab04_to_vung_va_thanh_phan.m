%% LOI GIAI LAB 4 - TO VUNG VA THANH PHAN LIEN THONG
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
BWfill=imfill(BW,'holes');
CC=bwconncomp(BWfill,8); L=labelmatrix(CC); S=regionprops(CC,'Area','Centroid');
figure('Name','Solution 4 - Fill and label');
subplot(1,3,1); imshow(BW); title('Binary');
subplot(1,3,2); imshow(BWfill); title('Filled holes');
subplot(1,3,3); imshow(label2rgb(L,'jet','k','shuffle')); title(sprintf('Labels: %d',CC.NumObjects));
fprintf('Tim thay %d thanh phan.\n',CC.NumObjects);
for k=1:numel(S), fprintf('#%d area=%g centroid=(%.1f,%.1f)\n',k,S(k).Area,S(k).Centroid); end
