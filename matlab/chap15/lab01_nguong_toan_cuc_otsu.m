%% LAB 1 - NGUONG TOAN CUC VA OTSU
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','rice.png')));
if ndims(I)==3, I=rgb2gray(I); end
Totsu=graythresh(I); Tmanual=0.48;
BWmanual=I>Tmanual; BWotsu=imbinarize(I,Totsu);
figure('Name','Lab 1 - Global thresholding');
subplot(2,2,1); imshow(I,[]); title('Anh goc');
subplot(2,2,2); imhist(I); xline(Totsu,'r','LineWidth',1.5); title(sprintf('Histogram, Otsu T=%.3f',Totsu));
subplot(2,2,3); imshow(BWmanual); title(sprintf('Nguong thu cong T=%.2f',Tmanual));
subplot(2,2,4); imshow(BWotsu); title('Nguong Otsu');
fprintf('Nguong Otsu = %.4f\n',Totsu);
