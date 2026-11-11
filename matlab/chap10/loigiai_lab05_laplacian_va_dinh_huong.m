%% LOI GIAI LAB 5 - LAPLACIAN VA EMBOSS
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
H=[0 -1 0;-1 4 -1;0 -1 0]; L=imfilter(I,H,'replicate');
J=min(max(I+.6*L,0),1);
E=imfilter(I,[-2 -1 0;-1 1 1;0 1 2],'replicate');
figure; subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(L,[]); title('Laplacian');
subplot(2,2,3); imshow(J); title('Sharpened');
subplot(2,2,4); imshow(mat2gray(E)); title('Directional emboss');
