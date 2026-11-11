%% LOI GIAI LAB 5 - KET HOP LAY MAU VA LUONG TU HOA
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));
Is = imresize(I(1:4:end,1:4:end),size(I),'nearest');
Iq = uniform_quantize(I,4); Iboth = uniform_quantize(Is,4);
figure; subplot(2,2,1); imshow(I); title('Anh goc');
subplot(2,2,2); imshow(Is); title('Lay mau khong gian');
subplot(2,2,3); imshow(Iq); title('4 muc xam');
subplot(2,2,4); imshow(Iboth); title('Ket hop hai phep');
