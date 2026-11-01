%% LAB 6 - UNSHARP MASKING VA HIGH-BOOST
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif')));

blur = imfilter(I,fspecial('gaussian',[9 9],1.5),'replicate');
detail = I - blur;                 % Chi tiet cao tan so tu anh goc tru anh mo.
unsharp = min(max(I + 1.0*detail,0),1);
highboost = min(max(1.7*I - blur,0),1); % A*I - blur voi A>1.

figure('Name','Lab 6 - Unsharp va high boost');
subplot(2,2,1); imshow(I); title('Anh goc');
subplot(2,2,2); imshow(blur); title('Gaussian blur');
subplot(2,2,3); imshow(unsharp); title('Unsharp mask');
subplot(2,2,4); imshow(highboost); title('High-boost A=1.7');
% Tang he so lam sac net qua muc co the lam halo va khuếch đại nhiễu.
