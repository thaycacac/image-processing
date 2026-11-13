clear; close all; clc;

scriptDir = fileparts(mfilename('fullpath'));
I = imread('coins.png');
if size(I,3) == 3
    I = rgb2gray(I);
end

level = graythresh(I);
BW = imbinarize(I, level);

BW = imfill(BW, 'holes');
BW = imopen(BW, strel('disk', 3));
BW = bwareaopen(BW, 100);
BW = imclearborder(BW);
BW = imfill(BW, 'holes');

[L, numCoins] = bwlabel(BW);
stats = regionprops(L, 'Area', 'Centroid');
areas = [stats.Area];
centroids = cat(1, stats.Centroid);

areaThreshold = multithresh(areas, 1);
isLarge = areas > areaThreshold;
numLarge = nnz(isLarge);
numSmall = numCoins - numLarge;

fprintf('Otsu threshold (gray level): %.4f (%d/255)\n', level, round(level*255));
fprintf('Area threshold (Otsu on areas): %.1f pixels\n', areaThreshold);
fprintf('\n%-6s %-10s %-8s\n', 'Coin', 'Area', 'Type');
for k = 1:numCoins
    if isLarge(k)
        typeName = 'Large';
    else
        typeName = 'Small';
    end
    fprintf('%-6d %-10d %-8s\n', k, areas(k), typeName);
end
fprintf('\nTotal number of coins : %d\n', numCoins);
fprintf('Number of small coins : %d\n', numSmall);
fprintf('Number of large coins : %d\n', numLarge);

fig = figure('Name', 'Task 1 - Coin counting and classification', 'Position', [100 100 1200 450]);
if isprop(fig, 'Theme')
    fig.Theme = 'light';
end

subplot(1,3,1);
imshow(I);
title('Original image');

subplot(1,3,2);
imshow(BW);
title(sprintf('Binary (Otsu = %.3f) + morphology', level));

subplot(1,3,3);
imshow(I);
hold on;
for k = 1:numCoins
    if isLarge(k)
        color = 'r';
        typeName = 'L';
    else
        color = 'g';
        typeName = 'S';
    end
    boundary = bwboundaries(L == k, 'noholes');
    plot(boundary{1}(:,2), boundary{1}(:,1), color, 'LineWidth', 1.5);
    text(centroids(k,1), centroids(k,2), sprintf('%d%s', k, typeName), ...
        'Color', 'y', 'FontSize', 12, 'FontWeight', 'bold', ...
        'HorizontalAlignment', 'center', 'BackgroundColor', [0 0 0 0.5]);
end
hold off;
title(sprintf('Total %d: %d small (green), %d large (red)', numCoins, numSmall, numLarge));

exportgraphics(fig, fullfile(scriptDir, 'bai1_ket_qua.png'));
