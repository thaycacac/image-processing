%% LOI GIAI LAB 1 - DOC THONG TIN VA NAP ANH
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
imageFile = fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif');
info = imfinfo(imageFile); I = imread(imageFile);
disp(info);
fprintf('Image array: %s, class %s\n', mat2str(size(I)), class(I));
figure; imshow(I); title('Anh mau lenna.tif');
