%% LOI GIAI LAB 2 - LAY MAU KHONG GIAN
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(rgb2gray(imread(fullfile(scriptDir, '..', 'data', 'statue.png'))));
steps = [1 2 4 8]; figure('Name','Lay mau khong gian');
for k = 1:numel(steps)
    s = steps(k); Is = I(1:s:end,1:s:end);
    subplot(2,2,k); imshow(Is); title(sprintf('Buoc lay mau %d',s));
    fprintf('Buoc %d: kich thuoc %s\n',s,mat2str(size(Is)));
end
