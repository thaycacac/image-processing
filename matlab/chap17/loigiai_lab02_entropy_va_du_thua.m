%% LOI GIAI LAB 2 - ENTROPY VA DU THUA
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','lenna.tif'));
if ndims(I)==3, I=rgb2gray(I); end
p=imhist(I)/numel(I); p=p(p>0); H=-sum(p.*log2(p));
G=I(:,1:2:end); pg=imhist(G)/numel(G); pg=pg(pg>0); HG=-sum(pg.*log2(pg));
figure('Name','Solution 2 - Entropy');
subplot(2,2,1); imshow(I); title('Original'); subplot(2,2,2); imhist(I); title('Original histogram');
subplot(2,2,3); imshow(G); title('Horizontal subsampling'); subplot(2,2,4); imhist(G); title('Subsample histogram');
fprintf('H original = %.3f bits/pixel; H subsampled = %.3f bits/pixel\n',H,HG);
fprintf('Relative redundancy against 8-bit max = %.2f%%\n',100*(1-H/8));
