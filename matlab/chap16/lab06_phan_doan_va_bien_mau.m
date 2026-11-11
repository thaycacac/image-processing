%% LAB 6 - PHAN DOAN MAU VA PHAT HIEN BIEN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','statue.png')));
if ndims(I)==2, I=repmat(I,1,1,3); end
Lab=rgb2lab(I); [h,w,~]=size(I); seedRow=round(h/2); seedCol=round(w/2);
seed=reshape(Lab(seedRow,seedCol,:),1,1,3);
dist=sqrt(sum((Lab-seed).^2,3)); mask=dist<20;
gray=edge(rgb2gray(I),'canny'); channelEdges=false(h,w,3);
for c=1:3, channelEdges(:,:,c)=edge(I(:,:,c),'canny'); end
colorEdge=any(channelEdges,3); overlay=I;
for c=1:3
    plane=overlay(:,:,c); plane(mask)=.5*plane(mask)+.5*(c==1); overlay(:,:,c)=plane;
end
figure('Name','Lab 6 - Color segmentation and edges');
subplot(2,2,1); imshow(I); title('Anh mau'); hold on;
plot(seedCol,seedRow,'r+','MarkerSize',12,'LineWidth',2); hold off;
subplot(2,2,2); imshow(mask); title('Mat na gan mau trong Lab');
subplot(2,2,3); imshow(overlay); title('Vung phan doan phu mau do');
subplot(2,2,4); imshowpair(gray,colorEdge,'montage'); title('Canny xam / tong hop RGB');
fprintf('So pixel trong vung mau: %d\n',nnz(mask));
% Thu thay doi seed va nguong Delta E de quan sat do nhay phan doan.
