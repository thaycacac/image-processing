%% LAB 6 - GHI ANH VA KIEM TRA LAI
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
imageFile = fullfile(scriptDir, '..', 'data', 'lenna.tif');
I = imread(imageFile);
if size(I,3) == 3, Igray = rgb2gray(I); else, Igray = I; end

% Tao thu muc output trong chap04 neu chua ton tai.
outDir = fullfile(scriptDir, 'output');
if ~exist(outDir, 'dir'), mkdir(outDir); end
pngFile = fullfile(outDir, 'lenna_gray.png');
jpgLowFile = fullfile(outDir, 'lenna_gray_q20.jpg');
jpgHighFile = fullfile(outDir, 'lenna_gray_q95.jpg');

% PNG giu nguyen pixel; JPEG Quality dieu chinh muc nen (nen mat du lieu).
imwrite(Igray, pngFile);
imwrite(Igray, jpgLowFile, 'Quality', 20);
imwrite(Igray, jpgHighFile, 'Quality', 95);

% Doc lai PNG de kiem tra: dang PNG lossless nen pixel duoc bao toan.
Iread = imread(pngFile);
fprintf('PNG doc lai co giong anh goc khong? %d\n', isequal(Igray,Iread));

files = {pngFile, jpgLowFile, jpgHighFile};
for k = 1:numel(files)
    info = imfinfo(files{k});
    fprintf('%s: %d bytes, %s, %dx%d\n', ...
        info.Filename, info.FileSize, info.Format, info.Width, info.Height);
end

figure('Name','Lab 6 - So sanh chat luong JPEG');
subplot(1,3,1); imshow(Igray); title('Anh goc');
subplot(1,3,2); imshow(imread(jpgLowFile)); title('JPEG Quality 20');
subplot(1,3,3); imshow(imread(jpgHighFile)); title('JPEG Quality 95');
fprintf('File ket qua duoc luu trong: %s\n', outDir);
