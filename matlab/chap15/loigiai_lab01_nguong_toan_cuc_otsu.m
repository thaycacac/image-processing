%% LOI GIAI LAB 1 - NGUONG TOAN CUC VA OTSU
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','rice.png')));
if ndims(I)==3, I=rgb2gray(I); end
T=graythresh(I); B1=I>0.48; B2=imbinarize(I,T);
figure('Name','Solution 1 - Global thresholding');
subplot(2,2,1); imshow(I,[]); title('Original');
subplot(2,2,2); imhist(I); xline(T,'r','LineWidth',1.5); title(sprintf('Otsu T=%.4f',T));
subplot(2,2,3); imshow(B1); title('Manual T=0.48');
subplot(2,2,4); imshow(B2); title('Otsu');
fprintf('Otsu threshold: %.4f\n',T);
