%% LOI GIAI LAB 6 - GHI ANH VA KIEM TRA LAI
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', 'data', 'lenna.tif'));
if size(I,3) == 3, Igray = rgb2gray(I); else, Igray = I; end
outDir = fullfile(scriptDir, 'output');
if ~exist(outDir,'dir'), mkdir(outDir); end
pngFile = fullfile(outDir,'lenna_gray.png');
jpgFile = fullfile(outDir,'lenna_gray_q90.jpg');
imwrite(Igray,pngFile); imwrite(Igray,jpgFile,'Quality',90);
fprintf('PNG pixel roundtrip exact: %d\n', isequal(Igray,imread(pngFile)));
disp(imfinfo(pngFile)); disp(imfinfo(jpgFile));
figure; subplot(1,2,1); imshow(Igray); title('Gray original');
subplot(1,2,2); imshow(imread(jpgFile)); title('JPEG Q90');
