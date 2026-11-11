%% LOI GIAI LAB 1 - KICH THUOC FILE VA TY LE NEN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','lenna.tif'));
if ndims(I)==3, I=rgb2gray(I); end
outDir=fullfile(scriptDir,'output'); if ~exist(outDir,'dir'), mkdir(outDir); end
P=fullfile(outDir,'lenna_lossless.png'); J=fullfile(outDir,'lenna_jpeg.jpg');
imwrite(I,P); imwrite(I,J,'Quality',75);
s1=imfinfo(fullfile(scriptDir,'..','data','lenna.tif'));
s2=imfinfo(P); s3=imfinfo(J); sizes=[s1.FileSize s2.FileSize s3.FileSize];
figure('Name','Solution 1 - Compression sizes'); bar(sizes/1024);
set(gca,'XTickLabel',{'TIFF source','PNG','JPEG Q75'}); ylabel('KiB'); grid on;
fprintf('Bytes TIFF/PNG/JPEG: %d / %d / %d\n',sizes);
fprintf('TIFF-to-JPEG ratio: %.2f:1\n',sizes(1)/sizes(3));
