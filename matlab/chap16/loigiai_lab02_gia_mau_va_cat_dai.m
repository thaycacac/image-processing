%% LOI GIAI LAB 2 - GIA MAU VA CAT DAI CUONG DO
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','statue.png')));
if ndims(I)==3, G=rgb2gray(I); else, G=I; end
map=jet(256); pseudo=ind2rgb(gray2ind(G,256),map);
limits=[0 .2 .4 .6 .8 1]; sliced=zeros([size(G),3]);
for k=1:5
    m=G>=limits(k) & G<limits(k+1); idx=round(mean(limits(k:k+1))*255)+1;
    for c=1:3, sliced(:,:,c)=sliced(:,:,c)+double(m)*map(idx,c); end
end
figure('Name','Solution 2 - Pseudocolor');
subplot(1,3,1); imshow(G,[]); title('Grayscale');
subplot(1,3,2); imshow(pseudo); title('Jet pseudocolor');
subplot(1,3,3); imshow(sliced); title('Five intensity slices');
