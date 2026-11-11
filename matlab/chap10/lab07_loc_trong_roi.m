%% LAB 7 - LOC CHI TRONG VUNG QUAN TAM ROI
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));
[rows,cols] = size(I); [x,y] = meshgrid(1:cols,1:rows);

% Tao mask elip lam ROI. true/1 la pixel duoc loc.
mask = ((x-cols/2)/(cols*.28)).^2 + ((y-rows/2)/(rows*.35)).^2 <= 1;
H = fspecial('gaussian',[9 9],1.5);
% roifilt2 ap dung kernel trong ROI va giu nguyen pixel ngoai ROI.
J = roifilt2(H,I,mask);

figure('Name','Lab 7 - Loc ROI');
subplot(2,2,1); imshow(I); title('Anh goc');
subplot(2,2,2); imshow(mask); title('Mask ROI');
subplot(2,2,3); imshow(imfilter(I,H,'replicate')); title('Loc tren toan anh');
subplot(2,2,4); imshow(J); title('Chi loc trong ROI');
fprintf('So pixel ROI: %d / %d\n',nnz(mask),numel(mask));
