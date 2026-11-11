%% LOI GIAI LAB 6 - SO SANH PNG VA JPEG
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','lenna.tif'));
if ndims(I)==3, I=rgb2gray(I); end
outDir=fullfile(scriptDir,'output'); if ~exist(outDir,'dir'), mkdir(outDir); end
png=fullfile(outDir,'comparison.png'); imwrite(I,png); pngBytes=dir(png).bytes;
Q=[25 50 75 95]; B=zeros(size(Q)); P=B; S=B; J=cell(size(Q));
for k=1:numel(Q)
    f=fullfile(outDir,sprintf('comparison_q%d.jpg',Q(k))); imwrite(I,f,'Quality',Q(k));
    J{k}=imread(f); B(k)=dir(f).bytes; P(k)=psnr(im2double(J{k}),im2double(I)); S(k)=ssim(J{k},I);
end
figure('Name','Solution 6 - Compression comparison');
subplot(2,3,1); imshow(I); title('Original'); subplot(2,3,2); imshow(imread(png)); title('PNG lossless');
for k=1:4, subplot(2,3,k+2); imshow(J{k}); title(sprintf('JPEG Q%d, %.1f dB',Q(k),P(k))); end
fprintf('PNG %d bytes, exact reconstruction=%d\n',pngBytes,isequal(imread(png),I));
fprintf('Q\tBytes\tPNG/JPEG\tPSNR\tSSIM\n');
for k=1:4, fprintf('%d\t%d\t%.2f\t%.2f\t%.4f\n',Q(k),B(k),pngBytes/B(k),P(k),S(k)); end
