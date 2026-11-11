%% LAB 1 - TOAN TU DAO HAM BAC NHAT
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','cameraman2.tif')));
if ndims(I)==3, I=rgb2gray(I); end
methods={'roberts','prewitt','sobel'};
K=[5 5 5;-3 0 -3;-3 -3 -3];
masks=zeros(3,3,8);
for k=0:7, masks(:,:,k+1)=circshift(K,[0 k]); end
resp=zeros([size(I) 8]);
for k=1:8, resp(:,:,k)=imfilter(I,masks(:,:,k),'replicate'); end
kirsch=max(abs(resp),[],3);
kirsch=kirsch>graythresh(kirsch);
figure('Name','Lab 1 - First-order edge operators');
subplot(2,3,1); imshow(I,[]); title('Anh goc');
for k=1:4
    if k<=3, E=edge(I,methods{k}); else, E=kirsch; end
    subplot(2,3,k+1); imshow(E); if k<=3, title(upper(methods{k})); else, title('KIRSCH'); end
end
% So sanh do day, tinh lien tuc va muc nhieu cua tung ket qua.
