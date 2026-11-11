%% LOI GIAI LAB 3 - MINIMUM-DISTANCE CLASSIFIER
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath')); run(fullfile(scriptDir,'pattern_dataset.m'));
M=zeros(3,4); for c=1:3, M(c,:)=mean(Xnorm(trainIdx(y(trainIdx)==c),:),1); end
yt=y(testIdx); xt=Xnorm(testIdx,:); yp=zeros(size(yt));
for i=1:numel(yt), [~,yp(i)]=min(sum((M-xt(i,:)).^2,2)); end
C=zeros(3); for i=1:numel(yt), C(yt(i),yp(i))=C(yt(i),yp(i))+1; end
figure('Name','Solution 3 - Minimum distance');
subplot(1,2,1); hold on; col=lines(3);
for k=1:3, q=yt==k; scatter(xt(q,1),xt(q,3),35,col(k,:),'filled'); end
scatter(M(:,1),M(:,3),100,'kx','LineWidth',2); xlabel('Feature 1 (z)'); ylabel('Feature 3 (z)'); grid on; hold off;
subplot(1,2,2); imagesc(C); axis image; colorbar; xticks(1:3); yticks(1:3); xticklabels(classNames); yticklabels(classNames); title('Confusion matrix');
fprintf('Accuracy %.2f%%\n',100*sum(diag(C))/sum(C(:))); disp(C);
