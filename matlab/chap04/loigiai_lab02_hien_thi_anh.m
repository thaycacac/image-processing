%% LOI GIAI LAB 2 - CAC CACH HIEN THI ANH
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif'));
if size(I,3) == 3, Igray = rgb2gray(I); else, Igray = I; end
figure('Name','Cac cach hien thi');
subplot(2,2,1); imshow(Igray); title('imshow');
subplot(2,2,2); imshow(Igray,[]); title('Auto range');
subplot(2,2,3); imshow(Igray,[80 170]); title('Range 80-170');
subplot(2,2,4); imagesc(Igray); axis image; colormap gray; colorbar; title('imagesc');
