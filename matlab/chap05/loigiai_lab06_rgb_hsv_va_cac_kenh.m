%% LOI GIAI LAB 6 - RGB VA HSV
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'statue.png')));
HSV = rgb2hsv(I);
figure; subplot(2,2,1); imshow(I); title('RGB');
subplot(2,2,2); imshow(HSV(:,:,1),[]); title('Hue');
subplot(2,2,3); imshow(HSV(:,:,2),[]); title('Saturation');
subplot(2,2,4); imshow(HSV(:,:,3),[]); title('Value');
