%% LOI GIAI LAB 4 - FOURIER DESCRIPTOR CHO DUONG BIEN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png')); if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
CC=bwconncomp(BW,8); [~,k]=max(cellfun(@numel,CC.PixelIdxList)); O=false(size(BW)); O(CC.PixelIdxList{k})=true;
B=bwboundaries(O,'noholes'); P=B{1}; z=P(:,2)+1i*P(:,1); F=fft(z); N=[4 12 32];
figure('Name','Solution 4 - Fourier descriptors'); subplot(2,2,1); imshow(O); title('Original shape');
for q=1:3
    n=N(q); keep=false(size(F)); keep(1:n+1)=true; keep(end-n+1:end)=true; rec=ifft(F.*keep);
    subplot(2,2,q+1); plot(real(rec),imag(rec)); axis ij equal tight; grid on; title(sprintf('Retained frequencies: %d',n));
end
