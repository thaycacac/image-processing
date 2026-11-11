%% LAB 6 - LAM SACH ANH NHI PHAN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
% Tao nhieu muoi tieu va dung mo/dong de lam sach.
noisy=imnoise(double(BW),'salt & pepper',0.035) > 0.5;
se=strel('disk',2,0);
opened=imopen(noisy,se); cleaned=imclose(opened,se);
figure('Name','Lab 6 - Binary cleanup');
subplot(2,2,1); imshow(BW); title('Anh sach ban dau');
subplot(2,2,2); imshow(noisy); title('Them nhieu muoi tieu');
subplot(2,2,3); imshow(opened); title('Mo: bo diem nho');
subplot(2,2,4); imshow(cleaned); title('Dong: noi khe nho');
% So sanh voi bwareaopen(noisy, N) va dieu chinh N theo kich thuoc vat the.
