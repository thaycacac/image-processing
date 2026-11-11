%% LAB 2 - DO BAT BIEN TRUOC BIEN DOI RST
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png')); if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
CC=bwconncomp(BW,8); [~,idx]=max(cellfun(@numel,CC.PixelIdxList)); O=false(size(BW)); O(CC.PixelIdxList{idx})=true;
base=measureShape(O); translated=circshift(O,[18 25]); rotated=imrotate(O,35,'nearest','crop'); scaled=imresize(O,.75,'nearest');
variants={O translated rotated scaled}; names={'Goc','Tinh tien','Quay 35 deg','Thu nho 0.75'}; F=zeros(4,4);
for k=1:4, F(k,:)=measureShape(variants{k}); end
figure('Name','Lab 2 - Shape invariance');
for k=1:4, subplot(2,2,k); imshow(variants{k}); title(names{k}); end
disp('Moi hang: [area perimeter circularity eccentricity]'); disp(F);
% Dien tich va chu vi doi theo scale; circularity/eccentricity tuong doi on dinh.

function f=measureShape(B)
S=regionprops(B,'Area','Perimeter','Eccentricity');
if isempty(S), f=zeros(1,4); return; end
[~,k]=max([S.Area]); s=S(k); f=[s.Area s.Perimeter 4*pi*s.Area/max(s.Perimeter^2,eps) s.Eccentricity];
end
