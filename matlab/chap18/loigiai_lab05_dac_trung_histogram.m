%% LOI GIAI LAB 5 - DAC TRUNG THONG KE TU HISTOGRAM
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','rice.png'))); if ndims(I)==3, I=rgb2gray(I); end
[h,w]=size(I); roi=I(1:floor(h/2),1:floor(w/2)); BW=I>graythresh(I); if mean(BW(:))>.5, BW=~BW; end
data={I(:),roi(:),I(BW)}; X=zeros(3,5);
for k=1:3
    x=data{k}; m=mean(x); s=std(x); z=0; if s>0, z=mean(((x-m)/s).^3); end
    p=imhist(x,256); p=p/sum(p); p=p(p>0); X(k,:)=[m s z sum(p.^2) -sum(p.*log2(p))];
end
figure('Name','Solution 5 - Histogram descriptors');
subplot(1,3,1); imshow(I,[]); title('Image'); subplot(1,3,2); imshow(roi,[]); title('ROI');
subplot(1,3,3); bar(X'); set(gca,'XTickLabel',{'Mean','Std','Skew','Energy','Entropy'}); legend({'Whole','ROI','Foreground'},'Location','best'); grid on;
disp('Rows are whole image, ROI, foreground; columns are mean, std, skew, energy, entropy.'); disp(X);
