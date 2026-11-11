%% LAB 1 - DOC THONG TIN VA NAP ANH
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
imageFile = fullfile(scriptDir, '..', 'data', 'lenna.tif');

% imfinfo doc metadata ma chua can nap cac pixel vao workspace.
info = imfinfo(imageFile);
fprintf('Ten tep: %s\n', info.Filename);
fprintf('Dinh dang: %s\n', info.Format);
fprintf('Kich thuoc: %d cot x %d hang\n', info.Width, info.Height);
fprintf('Bit depth: %d\n', info.BitDepth);
fprintf('Dung luong tep: %d bytes\n', info.FileSize);

% imread nap pixel vao bien I; size va class mo ta mang anh trong MATLAB.
I = imread(imageFile);
fprintf('Kich thuoc mang: %s; kieu du lieu: %s\n', mat2str(size(I)), class(I));
figure('Name','Lab 1 - Anh da doc'); imshow(I); title('Anh mau lenna.tif');
