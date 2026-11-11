%% LAB 5 - LAPLACIAN VA LOC DINH HUONG
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));

% Laplacian 4-neighbor xap xi dao ham bac hai; kernel co tong bang 0.
Hlap = [0 -1 0; -1 4 -1; 0 -1 0];
L = imfilter(I,Hlap,'replicate','same');
Jsharp = min(max(I + 0.6*L,0),1);

% Kernel emboss bat doi xung nhan manh mot huong, nen can offset de xem.
Hemboss = [-2 -1 0; -1 1 1; 0 1 2];
E = imfilter(I,Hemboss,'replicate','same');
Edisplay = mat2gray(E);

figure('Name','Lab 5 - Laplacian va directional filter');
subplot(2,2,1); imshow(I); title('Anh goc');
subplot(2,2,2); imshow(L,[]); title('Dap ung Laplacian');
subplot(2,2,3); imshow(Jsharp); title('Cong Laplacian vao anh');
subplot(2,2,4); imshow(Edisplay); title('Emboss/directional response');
