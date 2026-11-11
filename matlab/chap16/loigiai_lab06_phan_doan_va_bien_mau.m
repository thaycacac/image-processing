%% LOI GIAI LAB 6 - PHAN DOAN MAU VA PHAT HIEN BIEN
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','statue.png')));
if ndims(I)==2, I=repmat(I,1,1,3); end
Lab=rgb2lab(I); [h,w,~]=size(I); r=round(h/2); c=round(w/2);
ref=reshape(Lab(r,c,:),1,1,3); mask=sqrt(sum((Lab-ref).^2,3))<20;
edgeGray=edge(rgb2gray(I),'canny'); E=false(h,w,3);
for k=1:3, E(:,:,k)=edge(I(:,:,k),'canny'); end
edgeRGB=any(E,3); J=I;
for k=1:3
    plane=J(:,:,k); plane(mask)=.5*plane(mask)+.5*(k==1); J(:,:,k)=plane;
end
figure('Name','Solution 6 - Color segmentation');
subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(mask); title('Lab color distance < 20');
subplot(2,2,3); imshow(J); title('Segment overlay');
subplot(2,2,4); imshowpair(edgeGray,edgeRGB,'montage'); title('Grayscale / RGB Canny');
fprintf('Segment pixels: %d\n',nnz(mask));
