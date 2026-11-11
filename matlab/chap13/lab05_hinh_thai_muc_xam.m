%% LAB 5 - HINH THAI ANH MUC XAM
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','rice.png')));
if ndims(I)==3, I=rgb2gray(I); end
se=strel('disk',8,0);
D=imdilate(I,se); E=imerode(I,se); O=imopen(I,se); C=imclose(I,se);
whiteTop=imtophat(I,se); blackHat=imbothat(I,se);
figure('Name','Lab 5 - Grayscale morphology');
subplot(2,4,1); imshow(I,[]); title('Goc');
subplot(2,4,2); imshow(D,[]); title('Gian muc xam');
subplot(2,4,3); imshow(E,[]); title('Co muc xam');
subplot(2,4,4); imshow(O,[]); title('Mo');
subplot(2,4,5); imshow(C,[]); title('Dong');
subplot(2,4,6); imshow(whiteTop,[]); title('White top-hat');
subplot(2,4,7); imshow(blackHat,[]); title('Black bottom-hat');
subplot(2,4,8); imshow(I+whiteTop-blackHat,[]); title('Hieu chinh nen');
