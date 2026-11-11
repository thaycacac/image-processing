%% LAB 6 - DAC TRUNG KET CAU BANG GLCM
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','rice.png')); if ndims(I)==3, I=rgb2gray(I); end
I8=im2uint8(I); Q=uint8(floor(double(I8)/32));
[h,w]=size(Q); patches={Q(1:floor(h/2),1:floor(w/2)),Q(ceil(h/2):end,ceil(w/2):end)};
offsets=[0 1;-1 1;-1 0;-1 -1]; names={'0 deg','45 deg','90 deg','135 deg'};
metrics=zeros(2,4,4); glcms=cell(2,4);
for p=1:2
    G=graycomatrix(patches{p},'NumLevels',8,'GrayLimits',[0 7],'Offset',offsets,'Symmetric',true);
    props=graycoprops(G,{'Contrast','Correlation','Energy','Homogeneity'});
    metrics(p,:,1)=props.Contrast; metrics(p,:,2)=props.Correlation;
    metrics(p,:,3)=props.Energy; metrics(p,:,4)=props.Homogeneity;
    for d=1:4, glcms{p,d}=G(:,:,d); end
end
figure('Name','Lab 6 - GLCM texture features');
subplot(2,3,1); imshow(patches{1},[]); title('Vung tren-trai');
subplot(2,3,2); imshow(patches{2},[]); title('Vung duoi-phai');
subplot(2,3,3); imagesc(glcms{1,1}); axis image; colorbar; title('GLCM, offset 0 deg');
subplot(2,3,4); plot(1:4,metrics(1,:,1),'-o',1:4,metrics(2,:,1),'-s'); xticks(1:4); xticklabels(names); ylabel('Contrast'); legend('Vung 1','Vung 2'); grid on;
subplot(2,3,5); plot(1:4,metrics(1,:,4),'-o',1:4,metrics(2,:,4),'-s'); xticks(1:4); xticklabels(names); ylabel('Homogeneity'); grid on;
subplot(2,3,6); bar(squeeze(metrics(1,:,3))); xticklabels(names); ylabel('Energy / ASM'); title('Energy, vung 1'); grid on;
disp('metrics(region,orientation,:) = [contrast correlation energy homogeneity]'); disp(metrics);
