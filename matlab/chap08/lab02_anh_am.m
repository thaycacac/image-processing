%% LAB 2 - ANH AM (NEGATIVE)
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif'));

% imcomplement voi uint8 tinh 255-I; voi double [0,1] tinh 1-I.
J = imcomplement(I);
I01 = im2double(I);
Jformula = 1 - I01;

fprintf('I(100,100)=%d; negative=%d; tong hai muc xam 8-bit la %d.\n', ...
    I(100,100), J(100,100), double(I(100,100))+double(J(100,100)));
figure('Name','Lab 2 - Anh am');
subplot(1,3,1); imshow(I); title('Anh goc');
subplot(1,3,2); imshow(J); title('imcomplement(uint8)');
subplot(1,3,3); imshow(Jformula); title('1 - im2double(I)');
