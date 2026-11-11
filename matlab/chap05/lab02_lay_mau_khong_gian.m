%% LAB 2 - LAY MAU KHONG GIAN
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', 'data', 'statue.png'));
Igray = im2double(rgb2gray(I));
% Lay moi pixel thu 2, 4, 8 theo hai truc lam giam so mau khong gian.
I2 = Igray(1:2:end, 1:2:end);
I4 = Igray(1:4:end, 1:4:end);
I8 = Igray(1:8:end, 1:8:end);
fprintf('Kich thuoc goc: %s\n', mat2str(size(Igray)));
fprintf('Buoc 2: %s; buoc 4: %s; buoc 8: %s\n', mat2str(size(I2)), mat2str(size(I4)), mat2str(size(I8)));
figure('Name','Lab 2 - Giam lay mau');
subplot(2,2,1); imshow(Igray); title('Goc');
subplot(2,2,2); imshow(I2); title('Lay mau moi 2 pixel');
subplot(2,2,3); imshow(I4); title('Lay mau moi 4 pixel');
subplot(2,2,4); imshow(I8); title('Lay mau moi 8 pixel');
