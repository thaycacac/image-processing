%% LAB 4 - K-NEAREST NEIGHBORS
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath')); run(fullfile(scriptDir,'pattern_dataset.m'));
trainX=Xnorm(trainIdx,:); trainY=y(trainIdx); testX=Xnorm(testIdx,:); testY=y(testIdx);
ks=[1 5 11]; predictions=zeros(numel(testY),numel(ks)); accuracy=zeros(size(ks));
for q=1:numel(ks)
    for i=1:numel(testY)
        d=sum((trainX-testX(i,:)).^2,2); [~,order]=sort(d,'ascend'); predictions(i,q)=mode(trainY(order(1:ks(q))));
    end
    accuracy(q)=mean(predictions(:,q)==testY);
end
figure('Name','Lab 4 - k-NN');
subplot(1,2,1); bar(ks,100*accuracy); xlabel('k'); ylabel('Accuracy (%)'); title('Test accuracy'); grid on;
subplot(1,2,2); hold on; C=lines(3);
for c=1:3, rows=testY==c; scatter(testX(rows,1),testX(rows,3),32,C(c,:),'filled'); end
xlabel('Feature 1 (z)'); ylabel('Feature 3 (z)'); title('Test samples by true class'); legend(classNames,'Location','best'); grid on; hold off;
fprintf('k: '); fprintf('%d ',ks); fprintf('\nAccuracy: '); fprintf('%.1f%% ',100*accuracy); fprintf('\n');
