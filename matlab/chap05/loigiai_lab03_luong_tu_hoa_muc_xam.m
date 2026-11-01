%% LOI GIAI LAB 3 - LUONG TU HOA MUC XAM
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif')));
levels = [2 4 16 256]; figure('Name','Luong tu hoa');
for k = 1:4
    Iq = uniform_quantize(I,levels(k));
    subplot(2,2,k); imshow(Iq); title(sprintf('%d levels',levels(k)));
end
