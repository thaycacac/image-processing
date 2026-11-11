%% LOI GIAI LAB 5 - LOC VA KHU NHIEU ANH MAU
clear; close all; clc; rng(0);
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','statue.png')));
if ndims(I)==2, I=repmat(I,1,1,3); end
N=min(max(I+.06*randn(size(I)),0),1); F=zeros(size(I)); M=F; S=F;
g=fspecial('gaussian',[7 7],1.2); lap=[0 -1 0;-1 5 -1;0 -1 0];
for c=1:3
    F(:,:,c)=imfilter(N(:,:,c),g,'replicate');
    M(:,:,c)=medfilt2(N(:,:,c),[3 3]);
    S(:,:,c)=imfilter(I(:,:,c),lap,'replicate');
end
figure('Name','Solution 5 - Color filtering');
subplot(2,2,1); imshow(N); title('Noisy');
subplot(2,2,2); imshow(F); title('Gaussian filter');
subplot(2,2,3); imshow(M); title('Channel median');
subplot(2,2,4); imshow(min(max(S,0),1)); title('Channel sharpening');
