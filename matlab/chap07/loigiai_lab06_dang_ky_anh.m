%% LOI GIAI LAB 6 - DANG KY ANH
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
fixed=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
moving=imtranslate(fixed,[12 8],'OutputView','same');
tform=imregcorr(moving,fixed,'translation');
registered=imwarp(moving,tform,'OutputView',imref2d(size(fixed)));
fprintf('MAE before %.5f, after %.5f\n',mean(abs(fixed(:)-moving(:))),mean(abs(fixed(:)-registered(:))));
figure; subplot(1,3,1); imshow(fixed); title('Fixed');
subplot(1,3,2); imshow(moving); title('Moving');
subplot(1,3,3); imshow(registered); title('Registered');
