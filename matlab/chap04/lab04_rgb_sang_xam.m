%% LAB 4 - ANH RGB, CAC KENH VA CHUYEN SANG XAM
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
% Chon statue.png vi day la anh mau RGB trong bo du lieu thuc hanh.
I = imread(fullfile(scriptDir, '..', 'data', 'statue.png'));

% Anh RGB co ba mat phang: do, luc, lam.
R = I(:,:,1); G = I(:,:,2); B = I(:,:,3);
Igray = rgb2gray(I);
fprintf('Kich thuoc RGB: %s\n', mat2str(size(I)));
fprintf('Kich thuoc anh xam: %s\n', mat2str(size(Igray)));
fprintf('Pixel RGB tai (100,100): [%d %d %d]\n', R(100,100), G(100,100), B(100,100));
fprintf('Pixel xam tai (100,100): %d\n', Igray(100,100));

figure('Name','Lab 4 - RGB sang xam');
subplot(2,2,1); imshow(I); title('RGB');
subplot(2,2,2); imshow(R); title('Kenh do R');
subplot(2,2,3); imshow(G); title('Kenh luc G');
subplot(2,2,4); imshow(Igray); title('Anh xam rgb2gray');
