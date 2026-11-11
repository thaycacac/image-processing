%% LOI GIAI LAB 4 - K-NEAREST NEIGHBORS
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath')); run(fullfile(scriptDir,'pattern_dataset.m'));
trX=Xnorm(trainIdx,:); trY=y(trainIdx); teX=Xnorm(testIdx,:); teY=y(testIdx); K=[1 5 11]; A=zeros(size(K)); pred=zeros(numel(teY),numel(K));
for q=1:numel(K)
    for i=1:numel(teY), [~,ord]=sort(sum((trX-teX(i,:)).^2,2)); pred(i,q)=mode(trY(ord(1:K(q)))); end
    A(q)=mean(pred(:,q)==teY);
end
figure('Name','Solution 4 - kNN');
subplot(1,2,1); bar(K,100*A); xlabel('k'); ylabel('Accuracy (%)'); grid on;
subplot(1,2,2); hold on; colors=lines(3);
for c=1:3, ii=teY==c; scatter(teX(ii,1),teX(ii,3),32,colors(c,:),'filled'); end
xlabel('Feature 1 (z)'); ylabel('Feature 3 (z)'); title('Test feature space'); legend(classNames); grid on; hold off;
disp(table(K',A'*100,'VariableNames',{'k','AccuracyPercent'}));
