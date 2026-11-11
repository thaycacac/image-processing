%% LAB 1 - BIEN DOI TUYEN TINH: DO SANG VA TUONG PHAN
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));

% s = c*r + b; c > 1 tang tuong phan, b > 0 tang do sang.
c = 1.4; b = 0.08;
Jraw = c*I + b;
% Anh hien thi can nam trong [0,1], nen cat gia tri bi tran.
J = min(max(Jraw,0),1);

fprintf('Anh goc: min=%.3f, max=%.3f\n',min(I(:)),max(I(:)));
fprintf('Truoc clipping: min=%.3f, max=%.3f\n',min(Jraw(:)),max(Jraw(:)));
figure('Name','Lab 1 - Linear transform');
subplot(1,3,1); imshow(I); title('Anh goc');
subplot(1,3,2); imshow(J); title(sprintf('s = %.1f r + %.2f',c,b));
subplot(1,3,3); imshow(Jraw,[]); title('Jraw hien thi auto-range');
% Jraw co the vuot [0,1]; imshow(Jraw,[]) chi scale luc hien thi, khong cat pixel.
