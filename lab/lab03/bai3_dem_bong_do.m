clear; close all; clc;

scriptDir = fileparts(mfilename('fullpath'));
candidates = {'video_bai3.mp4', 'Video Bai.mp4'};
videoFile = '';
for k = 1:numel(candidates)
    if isfile(fullfile(scriptDir, candidates{k}))
        videoFile = fullfile(scriptDir, candidates{k});
        break;
    end
end
if isempty(videoFile)
    error('Video file not found in %s', scriptDir);
end

v = VideoReader(videoFile);
fps = v.FrameRate;
fprintf('Video: %s\n', videoFile);
fprintf('Size: %dx%d, %.2f fps, duration %.2f s\n', v.Width, v.Height, fps, v.Duration);

sampleStep = 5;
samples = {};
k = 0;
while hasFrame(v)
    frame = readFrame(v);
    k = k + 1;
    if mod(k - 1, sampleStep) == 0
        samples{end + 1} = frame;
    end
end
numFrames = k;
background = im2double(median(cat(4, samples{:}), 4));
clear samples;
staticRed = isRed(background);

minArea = 80;
minCircularity = 0.6;
diffThreshold = 0.15;

present = false(numFrames, 1);
ballArea = zeros(numFrames, 1);
ballCenter = nan(numFrames, 2);
times = zeros(numFrames, 1);

v.CurrentTime = 0;
k = 0;
while hasFrame(v)
    times(k + 1) = v.CurrentTime;
    frame = im2double(readFrame(v));
    k = k + 1;

    redMask = isRed(frame);
    foreground = max(abs(frame - background), [], 3) > diffThreshold;

    mask = redMask & (foreground | ~staticRed);
    mask = imopen(mask, strel('disk', 2));
    mask = imfill(mask, 'holes');
    mask = bwareaopen(mask, minArea);

    stats = regionprops(mask, 'Area', 'Centroid', 'Circularity');
    if ~isempty(stats)
        stats = stats([stats.Circularity] > minCircularity);
    end
    if ~isempty(stats)
        [ballArea(k), idx] = max([stats.Area]);
        ballCenter(k, :) = stats(idx).Centroid;
        present(k) = true;
    end
end

minGapFrames = round(0.5 * fps);
minRunFrames = round(0.3 * fps);
cleaned = ~bwareaopen(~present, minGapFrames);
cleaned = bwareaopen(cleaned, minRunFrames);

edges = diff([0; cleaned; 0]);
startIdx = find(edges == 1);
endIdx = find(edges == -1) - 1;
numAppearances = numel(startIdx);

fprintf('\nNumber of appearances of the red ball: %d\n', numAppearances);
fprintf('%-4s %-12s %-12s %-12s %-10s\n', '#', 'Start (s)', 'End (s)', 'Duration(s)', 'Frames');
for i = 1:numAppearances
    tStart = times(startIdx(i));
    tEnd = times(endIdx(i)) + 1/fps;
    fprintf('%-4d %-12.2f %-12.2f %-12.2f %d-%d\n', i, tStart, tEnd, tEnd - tStart, startIdx(i), endIdx(i));
end

fig = figure('Name', 'Task 3 - Red ball presence', 'Position', [100 100 1100 550]);
if isprop(fig, 'Theme')
    fig.Theme = 'light';
end

subplot(2,1,1);
stairs(times, double(cleaned), 'r', 'LineWidth', 2);
hold on;
for i = 1:numAppearances
    tStart = times(startIdx(i));
    tEnd = times(endIdx(i)) + 1/fps;
    text((tStart + tEnd)/2, 1.12, sprintf('#%d: %.2f-%.2f s', i, tStart, tEnd), ...
        'HorizontalAlignment', 'center', 'FontSize', 9);
end
hold off;
ylim([-0.2 1.3]);
xlim([0 numFrames/fps]);
yticks([0 1]);
yticklabels({'Absent', 'Present'});
xlabel('Time (s)');
ylabel('Ball state');
title(sprintf('Presence/absence signal of the red ball - %d appearances', numAppearances));
grid on;

subplot(2,1,2);
plot(times, ballArea, 'b', 'LineWidth', 1.2);
xlim([0 numFrames/fps]);
xlabel('Time (s)');
ylabel('Ball area (pixels)');
title('Detected red-ball area per frame');
grid on;

exportgraphics(fig, fullfile(scriptDir, 'bai3_tin_hieu_xuat_hien.png'));

sampleIdx = round((startIdx + endIdx) / 2);
if ~isempty(sampleIdx)
    fig2 = figure('Name', 'Task 3 - Detection samples', 'Position', [100 100 1200 300]);
    if isprop(fig2, 'Theme')
        fig2.Theme = 'light';
    end
    for i = 1:numAppearances
        subplot(1, numAppearances, i);
        imshow(read(v, sampleIdx(i)));
        hold on;
        if present(sampleIdx(i))
            r = sqrt(ballArea(sampleIdx(i)) / pi);
            viscircles(ballCenter(sampleIdx(i), :), r + 3, 'Color', 'y', 'LineWidth', 1.5);
        end
        hold off;
        title(sprintf('#%d at t = %.2f s', i, times(sampleIdx(i))));
    end
    exportgraphics(fig2, fullfile(scriptDir, 'bai3_mau_phat_hien.png'));
end

function mask = isRed(rgb)
hsvImage = rgb2hsv(rgb);
H = hsvImage(:, :, 1);
S = hsvImage(:, :, 2);
V = hsvImage(:, :, 3);
mask = (H < 0.05 | H > 0.95) & S > 0.5 & V > 0.3;
end
