%% LAB 5 - LOC VA KHU NHIEU ANH MAU
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','statue.png')));
if ndims(I)==2, I=repmat(I,1,1,3); end
rng(0); noisy=min(max(I+.06*randn(size(I)),0),1);
smooth=zeros(size(I)); medianRGB=zeros(size(I)); sharp=zeros(size(I));
h=fspecial('gaussian',[7 7],1.2); lap=[0 -1 0;-1 5 -1;0 -1 0];
for c=1:3
    smooth(:,:,c)=imfilter(noisy(:,:,c),h,'replicate');
    medianRGB(:,:,c)=medfilt2(noisy(:,:,c),[3 3]);
    sharp(:,:,c)=imfilter(I(:,:,c),lap,'replicate');
end
figure('Name','Lab 5 - Color filtering');
subplot(2,2,1); imshow(noisy); title('Anh co nhieu Gaussian');
subplot(2,2,2); imshow(smooth); title('Gaussian smoothing');
subplot(2,2,3); imshow(medianRGB); title('Median tung kenh');
subplot(2,2,4); imshow(min(max(sharp,0),1)); title('Laplacian sharpening tung kenh');
% Loc tung kenh RGB co the lam thay doi mau o bien va chi tiet.
