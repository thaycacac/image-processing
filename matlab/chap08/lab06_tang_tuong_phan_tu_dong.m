%% LAB 6 - TANG TUONG PHAN TU DONG
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
Ioriginal = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));
% Tao anh co tuong phan thap va hai pixel ngoai le de thay tac dung robust stretch.
I = 0.30 + 0.35 * Ioriginal;
I(1,1) = 0; I(end,end) = 1;

% stretchlim uoc luong dải muc xam hữu ich, bo qua mot it pixel cuc tri.
limits = stretchlim(I,[0.01 0.99]);
Jauto = imadjust(I,limits,[0 1]);
% So sanh voi chuan hoa min-max don gian.
Jminmax = mat2gray(I);

fprintf('Nguong stretchlim: [%.4f %.4f]\n',limits(1),limits(2));
figure('Name','Lab 6 - Tu dong tang tuong phan');
subplot(2,2,1); imshow(I); title('Anh tuong phan thap + outlier');
subplot(2,2,2); imshow(Jauto); title('stretchlim + imadjust');
subplot(2,2,3); imshow(Jminmax); title('mat2gray min-max');
subplot(2,2,4); imshow(I,[limits(1) limits(2)]); title('Chi doi dải hien thi');
% Imshow voi dải khong sua I; imadjust tao anh moi voi pixel da duoc remap.
