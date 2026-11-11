%% LOI GIAI LAB 3 - FREEMAN CHAIN CODE VA SIGNATURE
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png')); if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
CC=bwconncomp(BW,8); [~,k]=max(cellfun(@numel,CC.PixelIdxList)); O=false(size(BW)); O(CC.PixelIdxList{k})=true;
B=bwboundaries(O,'noholes'); P=B{1}; D=[P(2:end,:);P(1,:)]-P;
dirs=[0 1;1 1;1 0;1 -1;0 -1;-1 -1;-1 0;-1 1]; [~,ix]=ismember(D,dirs,'rows'); C=ix-1;
shape=mod(diff([C;C(1)]),8); normShape=shape;
for n=1:numel(shape), v=circshift(shape,n-1); q=find(v(:)~=normShape(:),1); if ~isempty(q)&&v(q)<normShape(q), normShape=v; end, end
S=regionprops(O,'Centroid'); t=atan2(-(P(:,1)-S.Centroid(2)),P(:,2)-S.Centroid(1)); r=hypot(P(:,2)-S.Centroid(1),P(:,1)-S.Centroid(2));
figure('Name','Solution 3 - Chain code and signature');
subplot(1,3,1); imshow(O); hold on; plot(P(:,2),P(:,1),'r'); title('Boundary'); hold off;
subplot(1,3,2); stem(C,'.'); ylim([-1 8]); title('Freeman code');
subplot(1,3,3); plot(t,r); xlabel('Angle'); ylabel('Radius'); title('Boundary signature');
fprintf('Chain code (first 40): '); fprintf('%d ',C(1:min(40,end))); fprintf('\nShape number (first 40): '); fprintf('%d ',normShape(1:min(40,end))); fprintf('\n');
