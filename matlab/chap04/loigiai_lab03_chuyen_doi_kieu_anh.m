%% LOI GIAI LAB 3 - CHUYEN DOI KIEU DU LIEU ANH
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif'));
Icast = double(I); Id = im2double(I); Iback = im2uint8(Id);
fprintf('double(I) range: [%g,%g]\n', min(Icast(:)), max(Icast(:)));
fprintf('im2double(I) range: [%g,%g]\n', min(Id(:)), max(Id(:)));
fprintf('Round trip equals original: %d\n', isequal(I,Iback));
figure; subplot(1,3,1); imshow(I); title('uint8');
subplot(1,3,2); imshow(Id); title('im2double');
subplot(1,3,3); imshow(mat2gray(Icast)); title('mat2gray');
