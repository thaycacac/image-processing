%% LAB 4 - BIEN DOI AFFINE
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'statue.png'));
outView = imref2d(size(I(:,:,1)));

% affine2d dung ma tran chuyen doi theo quy uoc toa do hang-vector cua MATLAB.
Ttranslate = affine2d([1 0 0; 0 1 0; 45 25 1]);
Tscale = affine2d([1.25 0 0; 0 1.25 0; 0 0 1]);
Tshear = affine2d([1 0 0; 0.25 1 0; 0 0 1]);

Jtranslate = imwarp(I,Ttranslate,'OutputView',outView);
Jscale = imwarp(I,Tscale,'OutputView',outView);
Jshear = imwarp(I,Tshear,'OutputView',outView);

% Dung chung OutputView de so sanh tren cung khung; mot so vung co the thanh nen.
figure('Name','Lab 4 - Bien doi affine');
subplot(2,2,1); imshow(I); title('Goc');
subplot(2,2,2); imshow(Jtranslate); title('Tinh tien');
subplot(2,2,3); imshow(Jscale); title('Co gian');
subplot(2,2,4); imshow(Jshear); title('Shear');
