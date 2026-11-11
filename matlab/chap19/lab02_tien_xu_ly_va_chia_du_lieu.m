%% LAB 2 - CHUAN HOA VA CHIA TRAIN/TEST
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath')); run(fullfile(scriptDir,'pattern_dataset.m'));
colors=lines(3);
figure('Name','Lab 2 - Preprocessing and split');
subplot(1,2,1); hold on;
for c=1:3, scatter(X(trainIdx(y(trainIdx)==c),1),X(trainIdx(y(trainIdx)==c),3),28,'filled'); end
xlabel(featureNames{1}); ylabel(featureNames{3}); title('Training samples'); grid on; hold off;
subplot(1,2,2); hold on;
for c=1:3, bar(c,mean(Xnorm(y==c,1)),'FaceColor',colors(c,:)); end
xlabel('Class'); ylabel('Mean normalized intensity'); title('Train-fitted z-score'); xticks(1:3); grid on; hold off;
fprintf('Train=%d, test=%d. Mu/sigma estimated from training data only.\n',numel(trainIdx),numel(testIdx));
fprintf('Training means: '); fprintf('%.3f ',muTrain); fprintf('\nTraining stds: '); fprintf('%.3f ',sigmaTrain); fprintf('\n');
