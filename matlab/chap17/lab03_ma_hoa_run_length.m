%% LAB 3 - MA HOA VA GIAI MA RUN-LENGTH
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
x=uint8(BW(:)); starts=[1; find(diff(x)~=0)+1]; ends=[starts(2:end)-1; numel(x)];
values=x(starts); lengths=uint16(ends-starts+1);
decoded=repelem(values,double(lengths)); decoded=reshape(logical(decoded),size(BW));
rawBytes=numel(x); rleBytes=numel(values)+2*numel(lengths);
figure('Name','Lab 3 - Run-length coding');
subplot(1,3,1); imshow(BW); title('Anh nhi phan');
subplot(1,3,2); imshow(decoded); title('Sau giai ma');
subplot(1,3,3); bar([rawBytes rleBytes]); set(gca,'XTickLabel',{'Raw 1 byte/pixel','RLE value+uint16'}); ylabel('Bytes'); grid on;
fprintf('So run=%d; giai ma dung=%d; raw=%d byte; RLE=%d byte; ratio=%.3f\n',numel(values),isequal(BW,decoded),rawBytes,rleBytes,rawBytes/rleBytes);
% Moi run duoc luu bang 1 byte gia tri va 2 byte do dai; day la mo hinh don gian.
