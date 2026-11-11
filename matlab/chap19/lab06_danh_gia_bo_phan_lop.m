%% LAB 6 - DANH GIA BO PHAN LOP
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath')); run(fullfile(scriptDir,'pattern_dataset.m'));
trX=Xnorm(trainIdx,:); trY=y(trainIdx); teX=Xnorm(testIdx,:); teY=y(testIdx); nClass=numel(classNames);
% Minimum distance scores and predictions.
means=zeros(nClass,size(X,2));
for c=1:nClass, means(c,:)=mean(trX(trY==c,:),1); end
predMin=zeros(size(teY));
for i=1:numel(teY), [~,predMin(i)]=min(sum((means-teX(i,:)).^2,2)); end
% k-NN prediction.
predKNN=zeros(size(teY)); kValue=5;
for i=1:numel(teY), [~,ord]=sort(sum((trX-teX(i,:)).^2,2)); predKNN(i)=mode(trY(ord(1:kValue))); end
% Gaussian naive Bayes posterior scores.
mu=zeros(nClass,size(X,2)); v=mu; prior=zeros(nClass,1);
for c=1:nClass, z=trX(trY==c,:); mu(c,:)=mean(z,1); v(c,:)=var(z,0,1)+1e-4; prior(c)=size(z,1)/numel(trY); end
logS=zeros(numel(teY),nClass);
for c=1:nClass, d=teX-mu(c,:); logS(:,c)=log(prior(c))-.5*sum(log(2*pi*v(c,:))+d.^2./v(c,:),2); end
logS=logS-max(logS,[],2); post=exp(logS)./sum(exp(logS),2); [~,predBayes]=max(post,[],2);
predictions={predMin,predKNN,predBayes}; methodNames={'Minimum distance','k-NN (k=5)','Gaussian Bayes'};
C=cell(1,3); metrics=zeros(3,4);
for m=1:3
    C{m}=confMatrix(teY,predictions{m},nClass); [metrics(m,1),metrics(m,2),metrics(m,3),metrics(m,4)]=scoreMetrics(C{m});
end
thresholds=linspace(1,0,101); tpr=zeros(size(thresholds)); fpr=tpr;
for k=1:numel(thresholds)
    positive=post(:,1)>=thresholds(k); actual=teY==1;
    tpr(k)=sum(positive & actual)/sum(actual); fpr(k)=sum(positive & ~actual)/sum(~actual);
end
auc=trapz(fpr,tpr);
figure('Name','Lab 6 - Classifier evaluation');
for m=1:3
    subplot(2,3,m); imagesc(C{m}); axis image; colorbar; xticks(1:3); yticks(1:3); xticklabels(classNames); yticklabels(classNames); xlabel('Predicted'); ylabel('True'); title(methodNames{m});
end
subplot(2,3,4); bar(metrics(:,1:4)); xticklabels(methodNames); ylabel('Score'); legend({'Accuracy','Macro precision','Macro recall','Macro F1'},'Location','best'); ylim([0 1]); grid on;
subplot(2,3,5); plot(fpr,tpr,'b-','LineWidth',2); hold on; plot([0 1],[0 1],'k:'); xlabel('False positive rate'); ylabel('True positive rate'); title(sprintf('ROC class: %s, AUC %.3f',classNames{1},auc)); axis square; grid on; hold off;
subplot(2,3,6); bar(metrics(:,2:4)); xticklabels(methodNames); ylim([0 1]); legend({'Macro precision','Macro recall','Macro F1'},'Location','best'); grid on;
disp('Rows=methods; columns=[accuracy macroPrecision macroRecall macroF1]'); disp(metrics);

function C=confMatrix(a,b,n)
C=zeros(n); for i=1:numel(a), C(a(i),b(i))=C(a(i),b(i))+1; end
end
function [acc,prec,rec,f1]=scoreMetrics(C)
tp=diag(C); precClass=tp./max(sum(C,1)',1); recClass=tp./max(sum(C,2),1);
fClass=2*precClass.*recClass./max(precClass+recClass,eps);
acc=sum(tp)/sum(C(:)); prec=mean(precClass); rec=mean(recClass); f1=mean(fClass);
end
