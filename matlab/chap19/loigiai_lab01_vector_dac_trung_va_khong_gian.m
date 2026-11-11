%% LOI GIAI LAB 1 - VECTOR DAC TRUNG VA KHONG GIAN MAU
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath')); run(fullfile(scriptDir,'pattern_dataset.m'));
C=lines(3); figure('Name','Solution 1 - Feature representation');
subplot(1,2,1); hold on;
for k=1:3, scatter(X(y==k,1),X(y==k,3),35,C(k,:),'filled'); end
xlabel(featureNames{1}); ylabel(featureNames{3}); legend(classNames,'Location','best'); title('Feature vector projection'); grid on; hold off;
subplot(1,2,2); imagesc(X(1:12,:)'); colorbar; xlabel('Sample'); ylabel('Feature'); title('Feature vectors');
fprintf('%d samples x %d features; class counts: ',size(X,1),size(X,2)); fprintf('%d ',sum(y==(1:3),1)); fprintf('\n');
