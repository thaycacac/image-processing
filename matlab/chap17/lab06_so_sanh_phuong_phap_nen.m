%% LAB 6 - SO SANH PNG VA JPEG
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','lenna.tif'));
if ndims(I)==3, I=rgb2gray(I); end
outDir=fullfile(scriptDir,'output'); if ~exist(outDir,'dir'), mkdir(outDir); end
pngFile=fullfile(outDir,'comparison.png'); imwrite(I,pngFile); P=imread(pngFile);
Q=[25 50 75 95]; bytes=zeros(size(Q)); Psnr=bytes; Ssim=bytes; recon=cell(size(Q));
for k=1:numel(Q)
    file=fullfile(outDir,sprintf('comparison_q%d.jpg',Q(k)));
    imwrite(I,file,'Quality',Q(k)); recon{k}=imread(file); bytes(k)=dir(file).bytes;
    Psnr(k)=psnr(im2double(recon{k}),im2double(I)); Ssim(k)=ssim(recon{k},I);
end
figure('Name','Lab 6 - Compression comparison');
subplot(2,3,1); imshow(I); title('Goc');
subplot(2,3,2); imshow(P); title(sprintf('PNG, exact=%d',isequal(P,I)));
for k=1:4, subplot(2,3,k+2); imshow(recon{k}); title(sprintf('JPEG Q%d',Q(k))); end
fprintf('Format\tBytes\tRatio vs PNG\tPSNR\tSSIM\n');
fprintf('PNG\t%d\t1.00\t\tInf\t1.0000\n',dir(pngFile).bytes);
for k=1:numel(Q), fprintf('JPEG Q%d\t%d\t%.2f\t\t%.2f\t%.4f\n',Q(k),bytes(k),dir(pngFile).bytes/bytes(k),Psnr(k),Ssim(k)); end
