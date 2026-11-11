%% LOI GIAI LAB 4 - ANH RGB VA ANH XAM
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', 'data', 'statue.png'));
Igray = rgb2gray(I);
fprintf('RGB size %s; gray size %s\n', mat2str(size(I)), mat2str(size(Igray)));
figure; subplot(1,2,1); imshow(I); title('RGB');
subplot(1,2,2); imshow(Igray); title('Gray');
