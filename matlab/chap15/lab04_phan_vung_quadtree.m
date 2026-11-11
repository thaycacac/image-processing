%% LAB 4 - PHAN VUNG QUADTREE
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','cameraman2.tif')));
if ndims(I)==3, I=rgb2gray(I); end
% qtdecomp chia mot vung khi do bien thien muc xam vuot nguong.
threshold=0.06; minBlock=8; Q=qtdecomp(I,threshold,[minBlock 64]);
blocks=qtgetblk(I,Q,minBlock);
figure('Name','Lab 4 - Quadtree segmentation'); imshow(I,[]); title('Ranh gioi cac o quadtree'); hold on;
for r=1:minBlock:size(I,1)
    for c=1:minBlock:size(I,2)
        if Q(r,c)>0, rectangle('Position',[c r Q(r,c) Q(r,c)],'EdgeColor','r'); end
    end
end
hold off;
fprintf('So o kich thuoc %d pixel: %d\n',minBlock,size(blocks,1));
% Giam nguong de chia nhieu hon; tang nguong de giu cac vung lon hon.
