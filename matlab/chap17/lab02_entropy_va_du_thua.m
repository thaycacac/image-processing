%% LAB 2 - ENTROPY VA DU THUA
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','lenna.tif'));
if ndims(I)==3, I=rgb2gray(I); end
counts=imhist(I); p=counts/sum(counts); p=p(p>0);
H=-sum(p.*log2(p)); maxH=log2(256); redundancy=1-H/maxH;
G=I(:,1:2:end); hG=imhist(G); q=hG/sum(hG); q=q(q>0); HG=-sum(q.*log2(q));
figure('Name','Lab 2 - Entropy');
subplot(2,2,1); imshow(I); title('Anh goc');
subplot(2,2,2); imhist(I); title('Histogram goc');
subplot(2,2,3); imshow(G); title('Lay mau thua theo chieu ngang');
subplot(2,2,4); imhist(G); title('Histogram sau lay mau');
fprintf('Entropy goc %.3f bit/pixel (toi da %.1f), redundancy tuong doi %.1f%%\n',H,maxH,100*redundancy);
fprintf('Entropy anh lay mau: %.3f bit/pixel\n',HG);
% Entropy histogram bo qua tuong quan khong gian giua cac pixel.
