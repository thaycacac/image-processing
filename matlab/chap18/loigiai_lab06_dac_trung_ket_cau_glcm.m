%% LOI GIAI LAB 6 - DAC TRUNG KET CAU BANG GLCM
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','rice.png')); if ndims(I)==3, I=rgb2gray(I); end
Q=uint8(floor(double(im2uint8(I))/32)); [h,w]=size(Q);
R1=Q(1:floor(h/2),1:floor(w/2)); R2=Q(ceil(h/2):end,ceil(w/2):end);
offset=[0 1;-1 1;-1 0;-1 -1]; G1=graycomatrix(R1,'NumLevels',8,'GrayLimits',[0 7],'Offset',offset,'Symmetric',true);
G2=graycomatrix(R2,'NumLevels',8,'GrayLimits',[0 7],'Offset',offset,'Symmetric',true);
A=graycoprops(G1,{'Contrast','Correlation','Energy','Homogeneity'}); B=graycoprops(G2,{'Contrast','Correlation','Energy','Homogeneity'});
figure('Name','Solution 6 - GLCM descriptors');
subplot(2,3,1); imshow(R1,[]); title('Region 1'); subplot(2,3,2); imshow(R2,[]); title('Region 2');
subplot(2,3,3); imagesc(G1(:,:,1)); axis image; colorbar; title('Region 1 GLCM');
subplot(2,3,4); plot(A.Contrast,'-o'); title('Contrast by direction'); xticks(1:4); grid on;
subplot(2,3,5); plot(A.Homogeneity,'-o',B.Homogeneity,'-s'); title('Homogeneity'); legend('R1','R2'); xticks(1:4); grid on;
subplot(2,3,6); plot(A.Energy,'-o',B.Energy,'-s'); title('Energy / ASM'); legend('R1','R2'); xticks(1:4); grid on;
disp('Region 1 properties:'); disp(A); disp('Region 2 properties:'); disp(B);
