%% LAB 5 - GAUSSIAN NAIVE BAYES
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath')); run(fullfile(scriptDir,'pattern_dataset.m'));
trX=Xnorm(trainIdx,:); trY=y(trainIdx); teX=Xnorm(testIdx,:); teY=y(testIdx);
mu=zeros(3,size(X,2)); variance=mu; prior=zeros(3,1);
for c=1:3
    samples=trX(trY==c,:); mu(c,:)=mean(samples,1); variance(c,:)=var(samples,0,1)+1e-4; prior(c)=size(samples,1)/numel(trY);
end
logScore=zeros(numel(teY),3);
for c=1:3
    z=teX-mu(c,:); logScore(:,c)=log(prior(c))-.5*sum(log(2*pi*variance(c,:))+(z.^2)./variance(c,:),2);
end
[~,pred]=max(logScore,[],2); C=zeros(3);
for i=1:numel(teY), C(teY(i),pred(i))=C(teY(i),pred(i))+1; end
figure('Name','Lab 5 - Gaussian naive Bayes');
subplot(1,2,1); imagesc(C); axis image; colorbar; xticks(1:3); yticks(1:3); xticklabels(classNames); yticklabels(classNames); xlabel('Predicted'); ylabel('True'); title('Confusion matrix');
subplot(1,2,2); hold on; colors=lines(3);
for c=1:3, scatter(teX(teY==c,2),teX(teY==c,4),35,colors(c,:),'filled'); end
xlabel('Feature 2 (z)'); ylabel('Feature 4 (z)'); title('Test feature space'); legend(classNames); grid on; hold off;
fprintf('Naive Bayes accuracy: %.2f%%\n',100*mean(pred==teY)); disp(C);
