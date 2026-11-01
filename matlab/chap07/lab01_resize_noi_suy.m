%% LAB 1 - DOI KICH THUOC VA NOI SUY
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'statue.png'));

% Phong anh 2 lan voi ba quy tac noi suy.
nearest = imresize(I,2,'nearest');
bilinear = imresize(I,2,'bilinear');
bicubic = imresize(I,2,'bicubic');
fprintf('Anh goc %s; anh phong 2 lan %s.\n', mat2str(size(I)), mat2str(size(nearest)));

% nearest giu pixel goc nhung de thay block; bilinear/bicubic tao chuyen tiep muot hon.
figure('Name','Lab 1 - Noi suy khi phong anh');
subplot(2,2,1); imshow(I); title('Goc');
subplot(2,2,2); imshow(nearest); title('Nearest neighbor');
subplot(2,2,3); imshow(bilinear); title('Bilinear');
subplot(2,2,4); imshow(bicubic); title('Bicubic');

% Thu thu nho anh: noi suy tot khong the khoi phuc chi tiet da bi mat.
small = imresize(I,0.25,'bicubic');
figure('Name','Lab 1 - Thu nho'); imshow(small); title('Thu nho con 25%');
