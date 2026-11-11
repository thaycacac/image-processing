%% LAB 1 - PHAN TU CAU TRUC, GIAN VA CO
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I) == 3, I = rgb2gray(I); end
BW = imbinarize(I);
% Neu vat the trong anh la mau den, dao anh de tien canh la 1.
if mean(BW(:)) > 0.5, BW = ~BW; end
seSquare = strel('square',5);
seDisk = strel('disk',3,0);
D = imdilate(BW,seSquare);
E = imerode(BW,seSquare);
figure('Name','Lab 1 - SE, dilation and erosion');
subplot(2,3,1); imshow(BW); title('Anh nhi phan');
subplot(2,3,2); imshow(seSquare.Neighborhood); title('SE vuong 5x5');
subplot(2,3,3); imshow(D); title('Gian voi SE vuong');
subplot(2,3,4); imshow(E); title('Co voi SE vuong');
subplot(2,3,5); imshow(imdilate(BW,seDisk)); title('Gian voi SE dia');
subplot(2,3,6); imshow(imerode(BW,seDisk)); title('Co voi SE dia');
% Quan sat kich thuoc va hinh dang vat the thay doi ra sao.
