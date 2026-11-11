%% LAB 4 - JPEG QUALITY VA CHAT LUONG ANH
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','lenna.tif'));
if ndims(I)==3, I=rgb2gray(I); end
outDir=fullfile(scriptDir,'output'); if ~exist(outDir,'dir'), mkdir(outDir); end
qualities=[15 40 70 95]; psnrValues=zeros(size(qualities)); ssimValues=psnrValues; bytes=psnrValues;
figure('Name','Lab 4 - JPEG quality'); subplot(2,3,1); imshow(I); title('Anh goc');
for k=1:numel(qualities)
    file=fullfile(outDir,sprintf('lenna_q%d.jpg',qualities(k)));
    imwrite(I,file,'Quality',qualities(k)); J=imread(file);
    psnrValues(k)=psnr(im2double(J),im2double(I)); ssimValues(k)=ssim(J,I); bytes(k)=dir(file).bytes;
    subplot(2,3,k+1); imshow(J); title(sprintf('Q=%d, %.1f dB',qualities(k),psnrValues(k)));
end
fprintf('Q\tBytes\tPSNR(dB)\tSSIM\n');
for k=1:numel(qualities), fprintf('%d\t%d\t%.2f\t\t%.4f\n',qualities(k),bytes(k),psnrValues(k),ssimValues(k)); end
