%% LOI GIAI LAB 3 - PHAT TRIEN VUNG TU SEED
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','cameraman2.tif')));
if ndims(I)==3, I=rgb2gray(I); end
r=120; c=115; tol=[.04 .10 .18];
figure('Name','Solution 3 - Region growing');
subplot(2,2,1); imshow(I,[]); hold on; plot(c,r,'r+','MarkerSize',12,'LineWidth',2); title('Image and seed'); hold off;
for k=1:numel(tol)
    R=grayconnected(I,r,c,tol(k)); subplot(2,2,k+1); imshow(R); title(sprintf('Tolerance %.2f',tol(k)));
end
