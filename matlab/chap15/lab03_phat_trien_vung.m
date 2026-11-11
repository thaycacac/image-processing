%% LAB 3 - PHAT TRIEN VUNG TU SEED
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','cameraman2.tif')));
if ndims(I)==3, I=rgb2gray(I); end
seedRow=120; seedCol=115; tolerances=[0.04 0.10 0.18];
figure('Name','Lab 3 - Region growing'); subplot(2,2,1); imshow(I,[]); hold on;
plot(seedCol,seedRow,'r+','MarkerSize',12,'LineWidth',2); title('Anh va seed'); hold off;
for k=1:3
    R=grayconnected(I,seedRow,seedCol,tolerances(k));
    subplot(2,2,k+1); imshow(R); title(sprintf('Tolerance = %.2f',tolerances(k)));
end
% Seed nam theo toa do (hang, cot); thay doi seed va tolerance de xem do nhay.
