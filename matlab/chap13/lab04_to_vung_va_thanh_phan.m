%% LAB 4 - TO VUNG VA THANH PHAN LIEN THONG
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
filled=imfill(BW,'holes');
CC=bwconncomp(filled,8); L=labelmatrix(CC);
stats=regionprops(CC,'Area','Centroid','BoundingBox');
figure('Name','Lab 4 - Filling and connected components');
subplot(1,3,1); imshow(BW); title('Anh nhi phan');
subplot(1,3,2); imshow(filled); title('Sau khi to lo');
subplot(1,3,3); imshow(label2rgb(L,'jet','k','shuffle')); title(sprintf('%d thanh phan',CC.NumObjects));
fprintf('So thanh phan lien thong: %d\n',CC.NumObjects);
for k=1:numel(stats)
    fprintf('Thanh phan %d: dien tich=%g, tam=(%.1f, %.1f)\n',k,stats(k).Area,stats(k).Centroid(1),stats(k).Centroid(2));
end
