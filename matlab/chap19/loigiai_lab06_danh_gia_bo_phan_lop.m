%% LOI GIAI LAB 6 - DANH GIA BO PHAN LOP
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath')); run(fullfile(scriptDir,'pattern_dataset.m'));
trX=Xnorm(trainIdx,:); trY=y(trainIdx); teX=Xnorm(testIdx,:); teY=y(testIdx); n=3;
centers=zeros(n,4); for c=1:n, centers(c,:)=mean(trX(trY==c,:),1); end
pred1=zeros(size(teY)); for i=1:numel(teY), [~,pred1(i)]=min(sum((centers-teX(i,:)).^2,2)); end
pred2=zeros(size(teY)); for i=1:numel(teY), [~,ix]=sort(sum((trX-teX(i,:)).^2,2)); pred2(i)=mode(trY(ix(1:5))); end
M=zeros(n,4); V=M; prior=zeros(n,1);
for c=1:n, z=trX(trY==c,:); M(c,:)=mean(z); V(c,:)=var(z,0,1)+1e-4; prior(c)=size(z,1)/numel(trY); end
L=zeros(numel(teY),n);
for c=1:n, d=teX-M(c,:); L(:,c)=log(prior(c))-.5*sum(log(2*pi*V(c,:))+d.^2./V(c,:),2); end
L=L-max(L,[],2); post=exp(L)./sum(exp(L),2); [~,pred3]=max(post,[],2); preds={pred1,pred2,pred3};
CM=cell(1,3); scores=zeros(3,4);
for m=1:3
    CM{m}=zeros(n); for i=1:numel(teY), CM{m}(teY(i),preds{m}(i))=CM{m}(teY(i),preds{m}(i))+1; end
    tp=diag(CM{m}); p=tp./max(sum(CM{m},1)',1); r=tp./max(sum(CM{m},2),1); f=2*p.*r./max(p+r,eps);
    scores(m,:)=[sum(tp)/sum(CM{m}(:)) mean(p) mean(r) mean(f)];
end
t=linspace(1,0,101); tpr=zeros(size(t)); fpr=tpr; actual=teY==1;
for k=1:numel(t), pos=post(:,1)>=t(k); tpr(k)=sum(pos&actual)/sum(actual); fpr(k)=sum(pos&~actual)/sum(~actual); end
auc=trapz(fpr,tpr); names={'Minimum distance','k-NN','Gaussian Bayes'};
figure('Name','Solution 6 - Classification metrics');
for m=1:3, subplot(2,3,m); imagesc(CM{m}); axis image; colorbar; xticks(1:3); yticks(1:3); xticklabels(classNames); yticklabels(classNames); title(names{m}); end
subplot(2,3,4); bar(scores); xticklabels(names); ylim([0 1]); legend({'Accuracy','Macro P','Macro R','Macro F1'},'Location','best'); grid on;
subplot(2,3,5); plot(fpr,tpr,'b-','LineWidth',2); hold on; plot([0 1],[0 1],'k:'); axis square; grid on; xlabel('FPR'); ylabel('TPR'); title(sprintf('Class 1 ROC, AUC %.3f',auc)); hold off;
subplot(2,3,6); bar(scores(:,2:4)); xticklabels(names); ylim([0 1]); legend({'Precision','Recall','F1'},'Location','best'); grid on;
disp('Rows: minimum distance, kNN, Gaussian Bayes; columns: accuracy, macro P, macro R, macro F1.'); disp(scores);
