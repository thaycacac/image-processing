%% LOI GIAI LAB 6 - TU DONG TANG TUONG PHAN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I0=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
I=.30+.35*I0; I(1,1)=0; I(end,end)=1;
limits=stretchlim(I,[.01 .99]); J=imadjust(I,limits,[0 1]);
fprintf('Nguong: %.4f .. %.4f\n',limits(1),limits(2));
figure; subplot(1,2,1); imshow(I); title('Original');
subplot(1,2,2); imshow(J); title('Auto contrast');
