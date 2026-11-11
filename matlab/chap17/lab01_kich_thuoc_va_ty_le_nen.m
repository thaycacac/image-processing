%% LAB 1 - KICH THUOC FILE VA TY LE NEN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','lenna.tif'));
if ndims(I)==3, G=rgb2gray(I); else, G=I; end
outDir=fullfile(scriptDir,'output'); if ~exist(outDir,'dir'), mkdir(outDir); end
pngFile=fullfile(outDir,'lenna_lossless.png'); jpgFile=fullfile(outDir,'lenna_jpeg.jpg');
imwrite(G,pngFile); imwrite(G,jpgFile,'Quality',75);
sourceInfo=imfinfo(fullfile(scriptDir,'..','data','lenna.tif'));
pngInfo=imfinfo(pngFile); jpgInfo=imfinfo(jpgFile);
sizes=[sourceInfo.FileSize pngInfo.FileSize jpgInfo.FileSize]; names={'TIFF source','PNG lossless','JPEG quality 75'};
figure('Name','Lab 1 - File size and compression ratio');
bar(sizes/1024); set(gca,'XTickLabel',names); ylabel('Kich thuoc (KiB)'); grid on;
fprintf('TIFF: %d bytes; PNG: %d bytes; JPEG: %d bytes\n',sizes);
fprintf('Ty le TIFF/JPEG = %.2f:1\n',sizes(1)/sizes(3));
% Kich thuoc TIFF nguon phu thuoc cach tep goc duoc luu.
