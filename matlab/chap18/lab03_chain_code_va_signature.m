%% LAB 3 - FREEMAN CHAIN CODE VA SIGNATURE
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png')); if ndims(I)==3, I=rgb2gray(I); end
BW=imbinarize(I); if mean(BW(:))>.5, BW=~BW; end
CC=bwconncomp(BW,8); [~,k]=max(cellfun(@numel,CC.PixelIdxList)); O=false(size(BW)); O(CC.PixelIdxList{k})=true;
B=bwboundaries(O,'noholes'); boundary=B{1}; next=[boundary(2:end,:);boundary(1,:)]; delta=next-boundary;
dirs=[0 1;1 1;1 0;1 -1;0 -1;-1 -1;-1 0;-1 1];
[valid,code]=ismember(delta,dirs,'rows'); code=code(valid)-1;
shape=mod(diff([code;code(1)]),8); canonical=shape;
for k=1:numel(shape)
    candidate=circshift(shape,k-1); if lexLess(candidate,canonical), canonical=candidate; end
end
S=regionprops(O,'Centroid'); ctr=S.Centroid; theta=atan2(-(boundary(:,1)-ctr(2)),boundary(:,2)-ctr(1)); radius=hypot(boundary(:,2)-ctr(1),boundary(:,1)-ctr(2));
figure('Name','Lab 3 - Boundary descriptors');
subplot(1,3,1); imshow(O); hold on; plot(boundary(:,2),boundary(:,1),'r'); title('Bien duoc truy vet'); hold off;
subplot(1,3,2); stem(1:numel(code),code,'.'); ylim([-1 8]); xlabel('Pixel bien'); ylabel('Huong (0..7)'); title('Freeman chain code');
subplot(1,3,3); plot(theta,radius); xlabel('Goc (rad)'); ylabel('Khoang cach den tam'); title('Signature r(theta)');
fprintf('Chain code (%d huong dau): ',min(40,numel(code))); fprintf('%d ',code(1:min(40,end))); fprintf('\nShape number (%d huong dau): ',min(40,numel(canonical))); fprintf('%d ',canonical(1:min(40,end))); fprintf('\n');

function tf=lexLess(a,b)
q=find(a(:)~=b(:),1); tf=~isempty(q) && a(q)<b(q);
end
