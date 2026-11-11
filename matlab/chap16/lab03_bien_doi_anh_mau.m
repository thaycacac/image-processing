%% LAB 3 - BIEN DOI ANH MAU TRONG HSV
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','statue.png')));
if ndims(I)==2, I=repmat(I,1,1,3); end
H=rgb2hsv(I); vivid=H; vivid(:,:,2)=min(H(:,:,2)*1.5,1);
bright=H; bright(:,:,3)=min(H(:,:,3)*1.2,1);
hue=H; hue(:,:,1)=mod(H(:,:,1)+.12,1);
Ivivid=hsv2rgb(vivid); Ibright=hsv2rgb(bright); Ihue=hsv2rgb(hue);
figure('Name','Lab 3 - Color transformations');
subplot(2,2,1); imshow(I); title('Goc');
subplot(2,2,2); imshow(Ivivid); title('Tang saturation');
subplot(2,2,3); imshow(Ibright); title('Tang value');
subplot(2,2,4); imshow(Ihue); title('Dich hue');
% Thay doi tung thanh phan H, S, V de quan sat hieu ung rieng.
