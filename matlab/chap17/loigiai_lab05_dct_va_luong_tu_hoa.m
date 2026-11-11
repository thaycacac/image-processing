%% LOI GIAI LAB 5 - DCT KHOI VA LUONG TU HOA
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
if ndims(I)==3, I=rgb2gray(I); end
T=[16 11 10 16 24 40 51 61;12 12 14 19 26 58 60 55;14 13 16 24 40 57 69 56;14 17 22 29 51 87 80 62;18 22 37 56 68 109 103 77;24 35 55 64 81 104 113 92;49 64 78 87 103 121 120 101;72 92 95 98 112 100 103 99];
Q=[15 50 90]; out=zeros([size(I) 3]); scores=zeros(1,3);
for k=1:3
    A=zeros(size(I)); step=max(.1,(100-Q(k))/50)*T;
    for r=1:8:size(I,1)
        for c=1:8:size(I,2)
            B=I(r:r+7,c:c+7)*255-128; D=dct2(B);
            A(r:r+7,c:c+7)=(idct2(round(D./step).*step)+128)/255;
        end
    end
    out(:,:,k)=min(max(A,0),1); scores(k)=psnr(out(:,:,k),I);
end
figure('Name','Solution 5 - DCT quantization');
subplot(2,2,1); imshow(I); title('Original');
for k=1:3, subplot(2,2,k+1); imshow(out(:,:,k)); title(sprintf('Q-like %d, PSNR %.1f',Q(k),scores(k))); end
