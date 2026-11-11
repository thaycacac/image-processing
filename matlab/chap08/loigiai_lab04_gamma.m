%% LOI GIAI LAB 4 - GAMMA
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
g=[.5 1 2]; figure;
for k=1:3
    subplot(1,3,k); imshow(imadjust(I,[],[],g(k)));
    title(sprintf('gamma = %.1f',g(k)));
end
