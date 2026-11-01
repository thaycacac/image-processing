%% BAI 5 - LIEN THONG 4 VA 8
clear; close all; clc;

% Hai pixel foreground chi cham nhau tai goc.
X = logical([1 0; 0 1]);

% TODO: Hien thi X va giai thich so thanh phan theo 4-lien thong
% va theo 8-lien thong.
figure('Name','Bai 5 - Lien thong');
imagesc(X); axis image; colormap gray; colorbar;
title('Hai pixel chi cham nhau tai goc');
