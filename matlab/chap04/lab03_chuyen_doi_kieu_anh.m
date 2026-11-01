%% LAB 3 - CHUYEN DOI KIEU DU LIEU ANH
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif'));

% double(I) chi doi kieu nen gia tri van gan mien 0..255.
Icast = double(I);
% im2double doi kieu va chuan hoa uint8 tu 0..255 ve [0,1].
Id = im2double(I);
% Chuyen nguoc theo quy tac chuyen doi anh cua IPT.
Iback = im2uint8(Id);
% mat2gray dua min/max cua du lieu ve [0,1].
Irange = mat2gray(Icast);

fprintf('I: class=%s, min=%g, max=%g\n', class(I), min(I(:)), max(I(:)));
fprintf('double(I): class=%s, min=%g, max=%g\n', class(Icast), min(Icast(:)), max(Icast(:)));
fprintf('im2double(I): class=%s, min=%g, max=%g\n', class(Id), min(Id(:)), max(Id(:)));
fprintf('Round trip co giong anh goc khong? %d\n', isequal(I,Iback));

figure('Name','Lab 3 - Chuyen doi kieu');
subplot(1,3,1); imshow(I); title('uint8 goc');
subplot(1,3,2); imshow(Id); title('im2double: mien [0,1]');
subplot(1,3,3); imshow(Irange); title('mat2gray');
