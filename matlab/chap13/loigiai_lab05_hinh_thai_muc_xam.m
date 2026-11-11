%% LOI GIAI LAB 5 - HINH THAI ANH MUC XAM
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','rice.png')));
if ndims(I)==3, I=rgb2gray(I); end
se=strel('disk',8,0); D=imdilate(I,se); E=imerode(I,se);
O=imopen(I,se); C=imclose(I,se); T=imtophat(I,se); H=imbothat(I,se);
figure('Name','Solution 5 - Grayscale morphology');
subplot(2,4,1); imshow(I,[]); title('Original');
subplot(2,4,2); imshow(D,[]); title('Dilation');
subplot(2,4,3); imshow(E,[]); title('Erosion');
subplot(2,4,4); imshow(O,[]); title('Opening');
subplot(2,4,5); imshow(C,[]); title('Closing');
subplot(2,4,6); imshow(T,[]); title('White top-hat');
subplot(2,4,7); imshow(H,[]); title('Black bottom-hat');
subplot(2,4,8); imshow(I+T-H,[]); title('Top-hat correction');
