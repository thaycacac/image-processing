%% LAB 2 - NGUONG THICH NGHI
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','rice.png')));
if ndims(I)==3, I=rgb2gray(I); end
[h,w]=size(I); illumination=linspace(0.55,1.25,w); uneven=min(I.*illumination,1);
Tlocal=adaptthresh(uneven,0.48,'NeighborhoodSize',51,'ForegroundPolarity','bright');
BWlocal=imbinarize(uneven,Tlocal); BWglobal=imbinarize(uneven,graythresh(uneven));
figure('Name','Lab 2 - Adaptive thresholding');
subplot(2,2,1); imshow(uneven,[]); title('Anh voi nen sang khong deu');
subplot(2,2,2); imshow(BWglobal); title('Nguong Otsu toan cuc');
subplot(2,2,3); imshow(Tlocal,[]); title('Ban do nguong cuc bo');
subplot(2,2,4); imshow(BWlocal); title('Nguong thich nghi');
% Thu NeighborhoodSize 31, 51, 81 va so sanh nen/chi tiet bi mat.
