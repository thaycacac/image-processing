%% LOI GIAI LAB 3 - TRICH XUAT BIEN HINH THAI
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I)==3, I=rgb2gray(I); end
A=imbinarize(I); if mean(A(:))>.5, A=~A; end
B=strel('square',3); E=imerode(A,B); D=imdilate(A,B);
Bi=A & ~E; Be=D & ~A; G=D & ~E;
figure('Name','Solution 3 - Boundaries');
subplot(2,3,1); imshow(A); title('Anh goc');
subplot(2,3,2); imshow(Bi); title('Bien trong: A - erode(A)');
subplot(2,3,3); imshow(Be); title('Bien ngoai: dilate(A) - A');
subplot(2,3,4); imshow(G); title('Gradient: dilate(A) - erode(A)');
subplot(2,3,5); imshow(labeloverlay(A,G,'Colormap',[1 0 0])); title('Gradient mau do');
subplot(2,3,6); imshowpair(Bi,Be,'montage'); title('Bien trong / ngoai');
