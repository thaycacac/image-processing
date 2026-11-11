%% LOI GIAI LAB 3 - MA HOA VA GIAI MA RUN-LENGTH
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
x=uint8(BW(:)); starts=[1;find(diff(x)~=0)+1]; ends=[starts(2:end)-1;numel(x)];
value=x(starts); count=uint16(ends-starts+1);
recon=reshape(logical(repelem(value,double(count))),size(BW));
raw=numel(x); coded=numel(value)+2*numel(count);
figure('Name','Solution 3 - RLE');
subplot(1,3,1); imshow(BW); title('Input'); subplot(1,3,2); imshow(recon); title('Decoded');
subplot(1,3,3); bar([raw coded]); set(gca,'XTickLabel',{'Raw','RLE'}); ylabel('Bytes');
fprintf('Runs=%d; exact reconstruction=%d; size ratio=%.3f\n',numel(value),isequal(BW,recon),raw/coded);
