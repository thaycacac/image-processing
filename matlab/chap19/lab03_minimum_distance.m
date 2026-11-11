%% LAB 3 - MINIMUM-DISTANCE CLASSIFIER
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath')); run(fullfile(scriptDir,'pattern_dataset.m'));
means=zeros(3,size(X,2));
for c=1:3, means(c,:)=mean(Xnorm(trainIdx(y(trainIdx)==c),:),1); end
Xtest=Xnorm(testIdx,:); ytest=y(testIdx); pred=zeros(size(ytest));
for i=1:numel(testIdx)
    d=sum((means-Xtest(i,:)).^2,2); [~,pred(i)]=min(d);
end
cm=makeConfusion(ytest,pred,3); accuracy=sum(diag(cm))/sum(cm(:));
figure('Name','Lab 3 - Minimum distance');
subplot(1,2,1); hold on; C=lines(3);
for c=1:3, ii=find(ytest==c); scatter(Xtest(ii,1),Xtest(ii,3),36,C(c,:),'o'); end
scatter(means(:,1),means(:,3),100,'k','x','LineWidth',2); xlabel('Feature 1 (z)'); ylabel('Feature 3 (z)'); title('Class means'); grid on; hold off;
subplot(1,2,2); imagesc(cm); axis image; colorbar; xticks(1:3); yticks(1:3); xticklabels(classNames); yticklabels(classNames); xlabel('Predicted'); ylabel('True'); title(sprintf('Confusion matrix, accuracy %.1f%%',100*accuracy));
disp('Rows=true, columns=predicted'); disp(cm);

function C=makeConfusion(a,b,n)
C=zeros(n); for i=1:numel(a), C(a(i),b(i))=C(a(i),b(i))+1; end
end
