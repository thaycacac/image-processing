%% LOI GIAI LAB 2 - CHUAN HOA VA CHIA TRAIN/TEST
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath')); run(fullfile(scriptDir,'pattern_dataset.m'));
figure('Name','Solution 2 - Train/test split');
subplot(1,2,1); hold on;
for c=1:3, ii=trainIdx(y(trainIdx)==c); scatter(X(ii,1),X(ii,3),28,'filled'); end
xlabel(featureNames{1}); ylabel(featureNames{3}); title('Training subset'); grid on; hold off;
subplot(1,2,2); bar([mean(Xnorm(y==1,1)) mean(Xnorm(y==2,1)) mean(Xnorm(y==3,1))]);
xlabel('Class'); ylabel('Mean z-score'); title('Feature after train-only scaling'); xticks(1:3); grid on;
fprintf('Train/test sizes %d/%d; train-only mean and standard deviation applied.\n',numel(trainIdx),numel(testIdx));
