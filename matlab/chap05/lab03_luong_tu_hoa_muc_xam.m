%% LAB 3 - LUONG TU HOA MUC XAM
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));
% So muc L quyet dinh so cuong do co the bieu dien.
levels = [2 4 16 256]; figure('Name','Lab 3 - So muc xam');
for k = 1:numel(levels)
    L = levels(k); Iq = uniform_quantize(I,L);
    subplot(2,2,k); imshow(Iq); title(sprintf('%d muc xam',L));
    fprintf('L=%d: so muc duy nhat trong anh=%d\n',L,numel(unique(Iq(:))));
end
% It muc tao banding ro hon; nhieu muc giu gradation muot hon.
