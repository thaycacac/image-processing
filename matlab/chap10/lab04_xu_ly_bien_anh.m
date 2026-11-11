%% LAB 4 - CAC QUY TAC XU LY BIEN ANH
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));
H = fspecial('average',[5 5]);

% Cung kernel, nhung cach padding khac nhau tao ket qua bien khac nhau.
Jzero = imfilter(I,H,0,'same');
Jreplicate = imfilter(I,H,'replicate','same');
Jsymmetric = imfilter(I,H,'symmetric','same');
Jcircular = imfilter(I,H,'circular','same');

figure('Name','Lab 4 - Border handling');
subplot(2,2,1); imshow(Jzero); title('Zero padding');
subplot(2,2,2); imshow(Jreplicate); title('Replicate');
subplot(2,2,3); imshow(Jsymmetric); title('Symmetric mirror');
subplot(2,2,4); imshow(Jcircular); title('Circular wrap');
% So sanh goc anh: zero co the tao vien toi; replicate/symmetric thuong giam vien gia.
