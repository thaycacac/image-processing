%% LOI GIAI LAB 6 - LAM SACH ANH NHI PHAN
clear; close all; clc; rng(0);
rng(0); scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
noisy=imnoise(double(BW),'salt & pepper',0.035) > 0.5;
opened=imopen(noisy,strel('disk',2,0)); cleaned=imclose(opened,strel('disk',2,0));
% Loai bo cac thanh phan nho con sot lai, nguong tinh theo pixel.
cleaned=bwareaopen(cleaned,12,8);
figure('Name','Solution 6 - Binary cleanup');
subplot(2,2,1); imshow(BW); title('Original');
subplot(2,2,2); imshow(noisy); title('Noisy');
subplot(2,2,3); imshow(opened); title('After opening');
subplot(2,2,4); imshow(cleaned); title('Opening + closing + area filter');
