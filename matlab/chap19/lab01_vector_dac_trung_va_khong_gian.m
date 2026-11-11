%% LAB 1 - VECTOR DAC TRUNG VA KHONG GIAN MAU
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath')); run(fullfile(scriptDir,'pattern_dataset.m'));
colors=lines(numel(classNames));
figure('Name','Lab 1 - Feature vectors and feature space');
subplot(1,2,1); hold on;
for c=1:3, rows=y==c; scatter(X(rows,1),X(rows,3),35,colors(c,:),'filled'); end
xlabel(featureNames{1}); ylabel(featureNames{3}); title('Feature-space projection'); legend(classNames,'Location','best'); grid on; hold off;
subplot(1,2,2); imagesc(X(1:12,:)'); colorbar; xlabel('Sample'); ylabel('Feature'); title('Twelve feature vectors');
fprintf('Dataset: %d samples, %d features, %d classes\n',size(X,1),size(X,2),numel(classNames));
disp('Feature names:'); disp(featureNames);
