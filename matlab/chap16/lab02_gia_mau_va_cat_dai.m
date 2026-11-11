%% LAB 2 - GIA MAU VA CAT DAI CUONG DO
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','statue.png')));
if ndims(I)==3, G=rgb2gray(I); else, G=I; end
map=jet(256); pseudo=ind2rgb(gray2ind(G,256),map);
edges=[0 .2 .4 .6 .8 1]; slice=zeros([size(G) 3]);
for k=1:numel(edges)-1
    mask=G>=edges(k) & G<edges(k+1);
    color=map(round((edges(k)+edges(k+1))*127.5)+1,:);
    for c=1:3, slice(:,:,c)=slice(:,:,c)+double(mask)*color(c); end
end
figure('Name','Lab 2 - Pseudocolor');
subplot(1,3,1); imshow(G,[]); title('Anh muc xam');
subplot(1,3,2); imshow(pseudo); title('Gia mau jet');
subplot(1,3,3); imshow(slice); title('Cat thanh 5 dai cuong do');
% Thu colormap khac va thay doi cac moc trong edges.
