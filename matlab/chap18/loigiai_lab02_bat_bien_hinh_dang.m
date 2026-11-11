%% LOI GIAI LAB 2 - DO BAT BIEN TRUOC BIEN DOI RST
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png')); if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
CC=bwconncomp(BW,8); [~,k]=max(cellfun(@numel,CC.PixelIdxList)); O=false(size(BW)); O(CC.PixelIdxList{k})=true;
images={O,circshift(O,[18 25]),imrotate(O,35,'nearest','crop'),imresize(O,.75,'nearest')};
F=zeros(4,4); names={'Original','Translated','Rotated','Scaled'};
for k=1:4
    S=regionprops(images{k},'Area','Perimeter','Eccentricity'); [~,j]=max([S.Area]); s=S(j);
    F(k,:)=[s.Area s.Perimeter 4*pi*s.Area/max(s.Perimeter^2,eps) s.Eccentricity];
end
figure('Name','Solution 2 - RST invariance');
for k=1:4, subplot(2,2,k); imshow(images{k}); title(names{k}); end
disp('Rows: area, perimeter, circularity, eccentricity'); disp(F);
