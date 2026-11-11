%% LAB 1 - TICH CHAP VA TUONG QUAN
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));

% Kernel khong doi xung de thay ro viec convolution lat kernel, correlation thi khong.
H = [1 2 0; 0 -1 0; 0 0 -2];
convResult = conv2(I,H,'same');
corrResult = filter2(H,I,'same');
fprintf('Max abs difference convolution/correlation: %.4f\n', ...
    max(abs(convResult(:)-corrResult(:))));

figure('Name','Lab 1 - Convolution va correlation');
subplot(1,3,1); imshow(I); title('Anh goc');
subplot(1,3,2); imshow(convResult,[]); title('conv2: convolution');
subplot(1,3,3); imshow(corrResult,[]); title('filter2: correlation');
% Kernel doi xung 180 do se cho ket qua convolution va correlation trung nhau.
