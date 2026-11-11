%% LAB 02 - MINH HOA HUAN LUYEN NHAN DANG SO 0 VA 1
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
files={fullfile(scriptDir,'Chapter 19 Classroom.png'), ...
       fullfile(scriptDir,'Chapter 19.png')};
labels=[0 1];

% Tien xu ly anh va tao bo mau co nhan.
trainX=[]; trainY=[];
for c=1:numel(files)
    I=imread(files{c});
    if ndims(I)==3, I=rgb2gray(I); end
    BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
    base=normalizeDigit(BW,32);
    variants={base, circshift(base,[0 2]), circshift(base,[0 -2]), ...
        circshift(base,[2 0]), circshift(base,[-2 0]), ...
        imrotate(base,5,'nearest','crop'), imrotate(base,-5,'nearest','crop')};
    for v=1:numel(variants)
        trainX(end+1,:)=double(variants{v}(:))'; %#ok<SAGROW>
        trainY(end+1,1)=labels(c); %#ok<SAGROW>
    end
end

% Du doan tren hai anh goc bang k-NN voi k=3.
k=3; predicted=zeros(1,2);
for c=1:2
    I=imread(files{c}); if ndims(I)==3, I=rgb2gray(I); end
    BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
    query=double(normalizeDigit(BW,32)); query=query(:)';
    d=sqrt(sum((trainX-query).^2,2)); [~,order]=sort(d,'ascend');
    nearestLabels=trainY(order(1:k)); predicted(c)=mode(nearestLabels);
end

figure('Name','Lab 02 - Recognizing 0 and 1');
for c=1:2
    I=imread(files{c}); if ndims(I)==3, I=rgb2gray(I); end
    BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
    subplot(2,2,c); imshow(BW); title(sprintf('Input, expected %d',labels(c)));
    subplot(2,2,c+2); imshow(normalizeDigit(BW,32));
    title(sprintf('Predicted %d (k=%d)',predicted(c),k));
end
fprintf('Samples after augmentation: %d (%d per class)\n',size(trainX,1),size(trainX,1)/2);
fprintf('Expected labels:  '); fprintf('%d ',labels); fprintf('\nPredicted labels: '); fprintf('%d ',predicted); fprintf('\n');

function out=normalizeDigit(BW,outSize)
% Crop to foreground bounds, preserve aspect ratio, and center on fixed canvas.
[r,c]=find(BW);
if isempty(r), out=false(outSize); return; end
BW=BW(min(r):max(r),min(c):max(c));
[h,w]=size(BW); scale=(outSize-4)/max(h,w);
newH=max(1,round(h*scale)); newW=max(1,round(w*scale));
small=imresize(BW,[newH newW],'nearest'); out=false(outSize);
r0=floor((outSize-newH)/2)+1; c0=floor((outSize-newW)/2)+1;
out(r0:r0+newH-1,c0:c0+newW-1)=small;
end
