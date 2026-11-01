%% LOI GIAI LAB 5 - KHAO SAT PIXEL VA PROFILE
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif'));
if size(I,3) == 3, Igray = rgb2gray(I); else, Igray = I; end
row = 120; col = 160;
fprintf('Igray(%d,%d) = %d\n', row, col, Igray(row,col));
values = impixel(Igray, [col 100 200], [row 100 150]); disp(values);
[~,~,profile] = improfile(Igray, [40 220], [80 180], 100);
figure; plot(profile); grid on; xlabel('Mau'); ylabel('Muc xam');
title('Profile doc theo doan thang');
