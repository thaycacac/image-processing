%% LOI GIAI LAB 4 - JPEG QUALITY VA CHAT LUONG ANH
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','lenna.tif'));
if ndims(I)==3, I=rgb2gray(I); end
outDir=fullfile(scriptDir,'output'); if ~exist(outDir,'dir'), mkdir(outDir); end
Q=[15 40 70 95]; P=zeros(size(Q)); S=P; B=P;
figure('Name','Solution 4 - JPEG quality'); subplot(2,3,1); imshow(I); title('Original');
for k=1:numel(Q)
    f=fullfile(outDir,sprintf('lenna_q%d.jpg',Q(k))); imwrite(I,f,'Quality',Q(k)); J=imread(f);
    P(k)=psnr(im2double(J),im2double(I)); S(k)=ssim(J,I); B(k)=dir(f).bytes;
    subplot(2,3,k+1); imshow(J); title(sprintf('Q%d, PSNR %.1f dB',Q(k),P(k)));
end
fprintf('Quality\tBytes\tPSNR\tSSIM\n'); fprintf('%d\t%d\t%.2f\t%.4f\n',[Q;B;P;S]);
