%% LOI GIAI LAB 4 - BIEN DOI AFFINE
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','..','..','Practice','statue.png'));
R=imref2d(size(I(:,:,1)));
T1=affine2d([1 0 0;0 1 0;45 25 1]);
T2=affine2d([1.25 0 0;0 1.25 0;0 0 1]);
T3=affine2d([1 0 0;0.25 1 0;0 0 1]);
figure; subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(imwarp(I,T1,'OutputView',R)); title('Translation');
subplot(2,2,3); imshow(imwarp(I,T2,'OutputView',R)); title('Scale');
subplot(2,2,4); imshow(imwarp(I,T3,'OutputView',R)); title('Shear');
