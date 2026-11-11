%% LAB 6 - HISTOGRAM SLIDING, STRETCHING VA SHRINKING
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));

% Sliding: cong offset lam sang hon, cat ve mien [0,1] khi vuot nguong.
offset = 0.20;
Jslide = min(I + offset,1);
% Stretching: dau vao [.20,.80] duoc keo ra day [0,1].
Jstretch = imadjust(I,[0.20 0.80],[0 1]);
% Shrinking: toan dai [0,1] bi nen vao khoang [.25,.75].
Jshrink = imadjust(I,[0 1],[0.25 0.75]);

images = {I,Jslide,Jstretch,Jshrink};
titles = {'Goc','Sliding +0.20','Stretching','Shrinking'};
figure('Name','Lab 6 - Bien doi histogram');
for k = 1:4
    subplot(4,2,2*k-1); imshow(images{k}); title(titles{k});
    subplot(4,2,2*k); imhist(images{k}); title(['Histogram - ' titles{k}]);
end
