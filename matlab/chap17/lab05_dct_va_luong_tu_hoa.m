%% LAB 5 - DCT KHOI VA LUONG TU HOA
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
if ndims(I)==3, I=rgb2gray(I); end
Qjpeg=[16 11 10 16 24 40 51 61;12 12 14 19 26 58 60 55;14 13 16 24 40 57 69 56;14 17 22 29 51 87 80 62;18 22 37 56 68 109 103 77;24 35 55 64 81 104 113 92;49 64 78 87 103 121 120 101;72 92 95 98 112 100 103 99];
qualities=[15 50 90]; results=zeros([size(I) numel(qualities)]); p=zeros(size(qualities));
for q=1:numel(qualities)
    scale=max(.1,(100-qualities(q))/50); table=Qjpeg*scale; J=zeros(size(I));
    for r=1:8:size(I,1)
        for c=1:8:size(I,2)
            block=I(r:r+7,c:c+7)*255-128; C=dct2(block);
            Cq=round(C./table); J(r:r+7,c:c+7)=(idct2(Cq.*table)+128)/255;
        end
    end
    results(:,:,q)=min(max(J,0),1); p(q)=psnr(results(:,:,q),I);
end
figure('Name','Lab 5 - DCT block quantization');
subplot(2,2,1); imshow(I); title('Anh goc');
for q=1:3, subplot(2,2,q+1); imshow(results(:,:,q)); title(sprintf('Quality-like %d, %.1f dB',qualities(q),p(q))); end
% Day la mo phong DCT + luong tu hoa don gian, khong phai ma hoa JPEG day du.
