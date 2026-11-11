%% LAB 2 - SOBEL VA NGUONG
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','cameraman2.tif')));
if ndims(I)==3, I=rgb2gray(I); end
noisy=imnoise(I,'gaussian',0,0.003);
thresholds=[0.03 0.08 0.15];
figure('Name','Lab 2 - Sobel thresholds');
subplot(2,2,1); imshow(noisy,[]); title('Anh co nhieu');
for k=1:numel(thresholds)
    E=edge(noisy,'sobel',thresholds(k)); subplot(2,2,k+1); imshow(E);
    title(sprintf('Sobel, T = %.2f',thresholds(k)));
end
% T tang thuong giam bien yeu va ca dap ung gia do nhieu.
