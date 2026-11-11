%% LAB 4 - FOURIER DESCRIPTOR CHO DUONG BIEN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png')); if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
CC=bwconncomp(BW,8); [~,k]=max(cellfun(@numel,CC.PixelIdxList)); O=false(size(BW)); O(CC.PixelIdxList{k})=true;
B=bwboundaries(O,'noholes'); P=B{1}; z=P(:,2)+1i*P(:,1); F=fft(z); counts=[4 12 32]; recon=cell(size(counts));
for q=1:numel(counts)
    n=counts(q); keep=false(size(F)); keep(1:n+1)=true; keep(end-n+1:end)=true;
    recon{q}=ifft(F.*keep);
end
figure('Name','Lab 4 - Fourier descriptors');
subplot(2,2,1); imshow(O); title('Bien goc');
for q=1:3
    subplot(2,2,q+1); plot(real(recon{q}),imag(recon{q}),'b-'); axis ij equal tight; grid on;
    title(sprintf('%d he so moi phia',counts(q)));
end
fprintf('Tong so diem bien: %d; giu DC va toi da %d cap he so tan so thap.\n',numel(z),counts(end));
% Tang so he so giu lai de tang do chi tiet cua duong bien tai tao.
