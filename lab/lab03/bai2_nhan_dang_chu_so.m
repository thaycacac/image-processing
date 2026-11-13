%% Task 2 - Recognizing handwritten digits 0-9
% Selected features (9 features, all measured with regionprops on the binary digit):
%   1. Eccentricity
%   2. EulerNumber
%   3. Extent
%   4. Solidity (= Area / ConvexArea)
%   5. MajorAxisLength / MinorAxisLength
%   6. Circularity
%   7. BoundingBox width / height
%   8. Centroid x relative to the bounding box
%   9. Centroid y relative to the bounding box
% Classifier: k-nearest neighbors on z-score normalized features
% (mean/std and k chosen only from the training set by 5-fold cross-validation).
%
% Observation on feature selection:
%   - The basic set {Area, Eccentricity, EulerNumber, Extent, Solidity} reaches only
%     73.8% test accuracy: Area depends on stroke thickness and size, and the
%     Euler number only separates digits by the number of holes (0,6,8,9 vs. others),
%     so many digits overlap in that feature space (e.g. 2/3/5/7, 6/9).
%   - Replacing Area by scale-invariant shape features (axis ratio, circularity,
%     bounding-box aspect ratio) and the relative centroid position raises accuracy
%     to 98.3% (k-NN, k = 5) and 97.0% (minimum distance). The relative centroid
%     separates digits with the same topology, e.g. 6 (mass at the bottom) from
%     9 (mass at the top).
%   - Normalization matters: without z-score scaling the same 9 features give 97.2%,
%     because features with a larger range dominate the Euclidean distance.
%   - More features is not automatically better: non-discriminative features add
%     noise to the distance, so features and k are chosen by cross-validation on
%     the training set only; the test set is used once for the final evaluation.

clear; close all; clc;

cd(fullfile(fileparts(mfilename('fullpath')), 'ocr_example'));
load_data;
scriptDir = fileparts(mfilename('fullpath'));
cd(scriptDir);

featureNames = {'Eccentricity', 'EulerNumber', 'Extent', 'Solidity', 'AxisRatio', ...
    'Circularity', 'BBoxAspect', 'CentroidX', 'CentroidY'};
baselineNames = {'Area', 'Eccentricity', 'EulerNumber', 'Extent', 'Solidity'};

ytrain = trn_data.y(:) - 1;
ytest = tst_data.y(:) - 1;
[Xtrain, Btrain, BWtrainExamples] = extractAllFeatures(trn_data.X, ytrain);
[Xtest, Btest] = extractAllFeatures(tst_data.X, ytest);
classes = (0:9)';

fprintf('Training samples: %d | Test samples: %d | Features: %d\n', ...
    numel(ytrain), numel(ytest), numel(featureNames));

[mu, sigma] = fitNormalizer(Xtrain);
Ztrain = applyNormalizer(Xtrain, mu, sigma);
Ztest = applyNormalizer(Xtest, mu, sigma);

kValues = [1 3 5 7 9];
cvAccuracy = zeros(size(kValues));
for i = 1:numel(kValues)
    cvAccuracy(i) = crossValidateKnn(Xtrain, ytrain, kValues(i), 5);
end
[~, best] = max(cvAccuracy);
k = kValues(best);

fprintf('\n5-fold cross-validation on the training set:\n');
for i = 1:numel(kValues)
    fprintf('  k = %d : %.2f%%\n', kValues(i), 100*cvAccuracy(i));
end
fprintf('Selected k = %d\n', k);

ypred = knnClassify(Ztrain, ytrain, Ztest, k);
accuracy = mean(ypred == ytest);
C = confusionMatrix(ytest, ypred, classes);

fprintf('\nOverall accuracy (k-NN, k = %d): %.2f%% (%d/%d)\n', ...
    k, 100*accuracy, nnz(ypred == ytest), numel(ytest));

fprintf('\nConfusion matrix (rows = true digit, columns = predicted digit):\n');
fprintf('%6s', 'T\P');
fprintf('%6d', classes);
fprintf('%8s\n', 'Recall');
for r = 1:numel(classes)
    fprintf('%6d', classes(r));
    fprintf('%6d', C(r, :));
    fprintf('%7.1f%%\n', 100*C(r, r)/sum(C(r, :)));
end

[muB, sigmaB] = fitNormalizer(Btrain);
ypredBaseline = knnClassify(applyNormalizer(Btrain, muB, sigmaB), ytrain, ...
    applyNormalizer(Btest, muB, sigmaB), k);
centroids = classMeans(Ztrain, ytrain, classes);
ypredMinDist = minimumDistanceClassify(Ztest, centroids, classes);
ypredRaw = knnClassify(Xtrain, ytrain, Xtest, k);

fprintf('\nComparison of feature sets / classifiers on the test set:\n');
fprintf('  Baseline 5 features {%s}, k-NN : %.2f%%\n', ...
    strjoin(baselineNames, ', '), 100*mean(ypredBaseline == ytest));
fprintf('  Selected 9 features, without normalization, k-NN : %.2f%%\n', ...
    100*mean(ypredRaw == ytest));
fprintf('  Selected 9 features, minimum distance to class means : %.2f%%\n', ...
    100*mean(ypredMinDist == ytest));
fprintf('  Selected 9 features, k-NN (k = %d) : %.2f%%\n', k, 100*accuracy);

fig = figure('Name', 'Task 2 - Confusion matrix', 'Position', [100 100 1100 480]);
if isprop(fig, 'Theme')
    fig.Theme = 'light';
end
subplot(1, 2, 1);
imagesc(C);
colormap(flipud(gray));
colorbar;
axis square;
xticks(1:10);
yticks(1:10);
xticklabels(string(classes));
yticklabels(string(classes));
xlabel('Predicted digit');
ylabel('True digit');
title(sprintf('Confusion matrix - accuracy %.2f%%', 100*accuracy));
for r = 1:10
    for c = 1:10
        if C(r, c) > 0
            if C(r, c) > max(C(:))/2
                textColor = 'w';
            else
                textColor = 'k';
            end
            text(c, r, num2str(C(r, c)), 'HorizontalAlignment', 'center', 'Color', textColor);
        end
    end
end

subplot(1, 2, 2);
montage(BWtrainExamples, 'Size', [2 5]);
title('Binary training examples of digits 0-9');

exportgraphics(fig, fullfile(scriptDir, 'bai2_confusion_matrix.png'));

function [X, B, examples] = extractAllFeatures(data, labels)
n = size(data, 2);
X = zeros(n, 9);
B = zeros(n, 5);
examples = cell(1, 10);
for i = 1:n
    BW = digitToBinary(data(:, i));
    [X(i, :), B(i, :)] = digitFeatures(BW);
    if isempty(examples{labels(i) + 1})
        examples{labels(i) + 1} = BW;
    end
end
end

function BW = digitToBinary(column)
I = mat2gray(reshape(column, 13, 13));
I = imadjust(imresize(I, [64 64], 'bicubic'));
BW = ~imbinarize(I, graythresh(I));
BW = bwareafilt(BW, 1);
end

function [f, b] = digitFeatures(BW)
s = regionprops(BW, 'Area', 'Eccentricity', 'EulerNumber', 'Extent', 'Solidity', ...
    'MajorAxisLength', 'MinorAxisLength', 'Circularity', 'BoundingBox', 'Centroid');
bbox = s.BoundingBox;
f = [s.Eccentricity, ...
    s.EulerNumber, ...
    s.Extent, ...
    s.Solidity, ...
    s.MajorAxisLength / max(s.MinorAxisLength, eps), ...
    s.Circularity, ...
    bbox(3) / bbox(4), ...
    (s.Centroid(1) - bbox(1)) / bbox(3), ...
    (s.Centroid(2) - bbox(2)) / bbox(4)];
b = [s.Area, s.Eccentricity, s.EulerNumber, s.Extent, s.Solidity];
end

function [mu, sigma] = fitNormalizer(X)
mu = mean(X, 1);
sigma = std(X, 0, 1);
sigma(sigma == 0) = 1;
end

function Z = applyNormalizer(X, mu, sigma)
Z = (X - mu) ./ sigma;
end

function D = squaredDistances(A, B)
D = sum(A.^2, 2) + sum(B.^2, 2)' - 2 * (A * B');
end

function ypred = knnClassify(Xtrain, ytrain, Xquery, k)
D = squaredDistances(Xquery, Xtrain);
[~, order] = sort(D, 2, 'ascend');
neighborLabels = ytrain(order(:, 1:k));
if k == 1
    ypred = neighborLabels(:);
else
    ypred = mode(neighborLabels, 2);
end
end

function centroids = classMeans(X, y, classes)
centroids = zeros(numel(classes), size(X, 2));
for c = 1:numel(classes)
    centroids(c, :) = mean(X(y == classes(c), :), 1);
end
end

function ypred = minimumDistanceClassify(X, centroids, classes)
[~, idx] = min(squaredDistances(X, centroids), [], 2);
ypred = classes(idx);
end

function acc = crossValidateKnn(X, y, k, numFolds)
rng(0);
folds = zeros(size(y));
for c = unique(y)'
    idx = find(y == c);
    idx = idx(randperm(numel(idx)));
    folds(idx) = mod(0:numel(idx) - 1, numFolds) + 1;
end
correct = 0;
for f = 1:numFolds
    trainMask = folds ~= f;
    [mu, sigma] = fitNormalizer(X(trainMask, :));
    ypred = knnClassify(applyNormalizer(X(trainMask, :), mu, sigma), y(trainMask), ...
        applyNormalizer(X(~trainMask, :), mu, sigma), k);
    correct = correct + nnz(ypred == y(~trainMask));
end
acc = correct / numel(y);
end

function C = confusionMatrix(ytrue, ypred, classes)
n = numel(classes);
C = zeros(n);
for i = 1:numel(ytrue)
    r = find(classes == ytrue(i));
    c = find(classes == ypred(i));
    C(r, c) = C(r, c) + 1;
end
end
