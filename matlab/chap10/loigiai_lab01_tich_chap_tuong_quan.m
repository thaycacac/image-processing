%% LOI GIAI LAB 1 - CONVOLUTION VA CORRELATION
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','..','..','Practice','lenna.tif')));
H=[1 2 0;0 -1 0;0 0 -2];
C=conv2(I,H,'same'); R=filter2(H,I,'same');
figure; subplot(1,2,1); imshow(C,[]); title('Convolution');
subplot(1,2,2); imshow(R,[]); title('Correlation');
fprintf('Max difference: %g\n',max(abs(C(:)-R(:))));
