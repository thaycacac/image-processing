%% LAB 6 - CHON ROI VA XU LY RIENG VUNG ANH
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif')));
[rows,cols] = size(I);
[x,y] = meshgrid(1:cols,1:rows);

% Tao ROI hinh chu nhat o giua anh bang mask logic.
mask = x >= round(cols*0.25) & x <= round(cols*0.75) & ...
       y >= round(rows*0.25) & y <= round(rows*0.75);

% Mask bien thanh 0 ngoai ROI, giu pixel ben trong.
roiOnly = immultiply(I,double(mask));
% Chi tang sang pixel trong ROI; cac pixel ben ngoai giu nguyen.
IbrightROI = I;
IbrightROI(mask) = min(IbrightROI(mask) + 0.25, 1);

fprintf('So pixel trong ROI: %d tren tong %d pixel.\n', nnz(mask), numel(mask));
figure('Name','Lab 6 - ROI');
subplot(2,2,1); imshow(I); title('Anh goc');
subplot(2,2,2); imshow(mask); title('Mask ROI');
subplot(2,2,3); imshow(roiOnly); title('Chi hien thi ROI');
subplot(2,2,4); imshow(IbrightROI); title('Tang sang trong ROI');
