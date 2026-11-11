%% LOI GIAI LAB 1 - DAC TRUNG VUNG NHI PHAN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png')); if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
CC=bwconncomp(BW,8); L=labelmatrix(CC);
S=regionprops(CC,'Area','Centroid','Perimeter','MajorAxisLength','MinorAxisLength','Eccentricity','EulerNumber');
A=[S.Area]'; P=[S.Perimeter]'; C=4*pi*A./max(P.^2,eps);
AR=[S.MajorAxisLength]'./max([S.MinorAxisLength]',eps); E=[S.Eccentricity]'; EN=[S.EulerNumber]';
X=[A C E AR EN];
figure('Name','Solution 1 - Region descriptors');
subplot(1,2,1); imshow(label2rgb(L,'jet','k','shuffle')); title('Connected components');
subplot(1,2,2); scatter(C,E,45,A,'filled'); xlabel('Circularity'); ylabel('Eccentricity'); colorbar; grid on;
disp('Feature rows: [area circularity eccentricity aspectRatio EulerNumber]'); disp(X);
