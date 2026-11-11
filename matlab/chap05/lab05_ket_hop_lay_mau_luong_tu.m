%% LAB 5 - KET HOP LAY MAU VA LUONG TU HOA
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));
% Giam mau roi phong lai nearest: kich thuoc ve nhu cu nhung thong tin da mat.
Isampled = I(1:4:end,1:4:end);
Ispatial = imresize(Isampled,size(I),'nearest');
Iquant4 = uniform_quantize(I,4);
Iboth = uniform_quantize(Ispatial,4);
figure('Name','Lab 5 - Khong gian va muc xam');
subplot(2,2,1); imshow(I); title('Anh goc');
subplot(2,2,2); imshow(Ispatial); title('Giam lay mau, nearest');
subplot(2,2,3); imshow(Iquant4); title('Chi con 4 muc xam');
subplot(2,2,4); imshow(Iboth); title('Giam lay mau + 4 muc xam');
% Giam pixel mat chi tiet hinh hoc; giam muc xam tao banding. Hai tac dong khac nhau.
