%% LOI GIAI LAB 3 - BIEN DOI ANH MAU TRONG HSV
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','statue.png')));
if ndims(I)==2, I=repmat(I,1,1,3); end
H=rgb2hsv(I); S=H; V=H; C=H; S(:,:,2)=min(1,1.5*H(:,:,2));
V(:,:,3)=min(1,1.2*H(:,:,3)); C(:,:,1)=mod(H(:,:,1)+.12,1);
figure('Name','Solution 3 - HSV transformations');
subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(hsv2rgb(S)); title('More saturated');
subplot(2,2,3); imshow(hsv2rgb(V)); title('Brighter');
subplot(2,2,4); imshow(hsv2rgb(C)); title('Hue shifted');
