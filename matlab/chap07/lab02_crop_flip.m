%% LAB 2 - CAT VUNG VA LAT ANH
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'statue.png'));

% imcrop nhan [x y width height], trong do x la cot, y la hang.
cropRect = [80 90 300 300];
Ic = imcrop(I,cropRect);
% flipud lat tren-duoi; fliplr lat trai-phai.
Ivertical = flipud(I);
Ihorizontal = fliplr(I);

figure('Name','Lab 2 - Crop va flip');
subplot(2,2,1); imshow(I); title('Anh goc');
subplot(2,2,2); imshow(Ic); title('Vung crop');
subplot(2,2,3); imshow(Ivertical); title('flipud - lat doc');
subplot(2,2,4); imshow(Ihorizontal); title('fliplr - lat ngang');
fprintf('Kich thuoc crop: %s\n',mat2str(size(Ic)));
