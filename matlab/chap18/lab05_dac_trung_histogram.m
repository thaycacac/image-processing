%% LAB 5 - DAC TRUNG THONG KE TU HISTOGRAM
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','rice.png'))); if ndims(I)==3, I=rgb2gray(I); end
[h,w]=size(I); roi=I(1:floor(h/2),1:floor(w/2)); T=graythresh(I); mask=I>T; if mean(mask(:))>.5, mask=~mask; end
regions={I(:),roi(:),I(mask)}; labels={'Toan anh','ROI goc tren trai','Tien canh'}; X=zeros(3,5);
for k=1:numel(regions)
    x=regions{k}; mu=mean(x); sigma=std(x); if sigma==0, sk=0; else, sk=mean(((x-mu)/sigma).^3); end
    h=imhist(x,256); p=h/sum(h); p=p(p>0); X(k,:)=[mu sigma sk sum(p.^2) -sum(p.*log2(p))];
end
figure('Name','Lab 5 - Histogram features');
subplot(1,3,1); imshow(I,[]); title('Anh goc');
subplot(1,3,2); imshow(roi,[]); title('ROI');
subplot(1,3,3); bar(X'); set(gca,'XTickLabel',{'Mean','Std','Skew','Energy','Entropy'}); legend(labels,'Location','best'); grid on;
disp('Moi hang: [mean std skewness energy entropy]'); disp(X);
% Histogram va cac thong ke nay khong ma hoa vi tri pixel.
