%% LAB 1 - DAC TRUNG VUNG NHI PHAN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
CC=bwconncomp(BW,8); L=labelmatrix(CC);
S=regionprops(CC,'Area','Centroid','Perimeter','MajorAxisLength','MinorAxisLength','Eccentricity','EulerNumber','BoundingBox');
area=[S.Area]'; perimeter=[S.Perimeter]'; ecc=[S.Eccentricity]';
circularity=4*pi*area./max(perimeter.^2,eps); aspect=[S.MajorAxisLength]'./max([S.MinorAxisLength]',eps);
features=[area circularity ecc aspect [S.EulerNumber]'];
figure('Name','Lab 1 - Binary region features');
subplot(1,2,1); imshow(label2rgb(L,'jet','k','shuffle')); title(sprintf('%d thanh phan',CC.NumObjects));
subplot(1,2,2); scatter(circularity,ecc,45,area,'filled'); xlabel('Circularity'); ylabel('Eccentricity'); colorbar; grid on;
disp('Cot vector: [area circularity eccentricity aspectRatio EulerNumber]'); disp(features);
