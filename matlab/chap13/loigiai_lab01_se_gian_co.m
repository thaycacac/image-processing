%% LOI GIAI LAB 1 - PHAN TU CAU TRUC, GIAN VA CO
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
se=strel('square',5); disk=strel('disk',3,0);
figure('Name','Solution 1 - Dilation and erosion');
subplot(2,3,1); imshow(BW); title('Anh nhi phan');
subplot(2,3,2); imshow(se.Neighborhood); title('SE vuong');
subplot(2,3,3); imshow(imdilate(BW,se)); title('Gian vuong');
subplot(2,3,4); imshow(imerode(BW,se)); title('Co vuong');
subplot(2,3,5); imshow(imdilate(BW,disk)); title('Gian dia');
subplot(2,3,6); imshow(imerode(BW,disk)); title('Co dia');
