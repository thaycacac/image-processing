%% LAB 3 - TRICH XUAT BIEN HINH THAI
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I)==3, I=rgb2gray(I); end
A=imbinarize(I); if mean(A(:))>.5, A=~A; end
B=strel('square',3);
eroded=imerode(A,B); dilated=imdilate(A,B);
inner=A & ~eroded; outer=dilated & ~A; gradient=dilated & ~eroded;
figure('Name','Lab 3 - Morphological boundaries');
subplot(2,3,1); imshow(A); title('A');
subplot(2,3,2); imshow(eroded); title('A erode B');
subplot(2,3,3); imshow(inner); title('Bien trong');
subplot(2,3,4); imshow(outer); title('Bien ngoai');
subplot(2,3,5); imshow(gradient); title('Gradient hinh thai');
subplot(2,3,6); imshow(labeloverlay(A,gradient,'Colormap',[1 0 0])); title('Bien chong len anh');
