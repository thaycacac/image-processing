%% LOI GIAI LAB 4 - PHAN VUNG QUADTREE
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','cameraman2.tif')));
if ndims(I)==3, I=rgb2gray(I); end
minBlock=8; threshold=.06; Q=qtdecomp(I,threshold,[minBlock 64]);
figure('Name','Solution 4 - Quadtree'); imshow(I,[]); title('Quadtree block boundaries'); hold on;
for r=1:minBlock:size(I,1)
    for c=1:minBlock:size(I,2)
        b=Q(r,c);
        if b>0, rectangle('Position',[c r b b],'EdgeColor','r'); end
    end
end
hold off;
fprintf('Blocks at size %d: %d\n',minBlock,nnz(Q==minBlock));
