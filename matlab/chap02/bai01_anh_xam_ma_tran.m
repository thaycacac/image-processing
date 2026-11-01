%% BAI 1 - ANH XAM LA MA TRAN PIXEL
clear; close all; clc;

I = uint8([0 40 80 120; ...
           30 70 110 150; ...
           60 100 140 180; ...
           90 130 190 255]);

disp('Kich thuoc anh I:'); disp(size(I));
disp('Kieu du lieu cua I:'); disp(class(I));

% TODO: Gan pixel hang 2, cot 3 vao p.
% p = ...

figure('Name','Bai 1 - Anh xam');
imagesc(I); axis image; colormap gray; colorbar;
title('Ma tran anh xam I');
