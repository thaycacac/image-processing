%% LAB 5 - WARP PHI TUYEN DANG RIPPLE (INVERSE MAPPING)
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(rgb2gray(imread(fullfile(scriptDir, '..', 'data', 'statue.png'))));
[rows,cols] = size(I);
[X,Y] = meshgrid(1:cols,1:rows);

% Moi pixel dau ra (X,Y) hoi mau tu toa do nguon (Xsrc,Ysrc).
% Day la inverse mapping; interp2 noi suy gia tri pixel nguon tai toa do le.
amplitude = 8; periodX = 90; periodY = 110;
Xsrc = X + amplitude * sin(2*pi*Y/periodY);
Ysrc = Y + amplitude * sin(2*pi*X/periodX);
J = interp2(I,Xsrc,Ysrc,'linear',0);

figure('Name','Lab 5 - Ripple warp');
subplot(1,2,1); imshow(I); title('Anh goc');
subplot(1,2,2); imshow(J); title('Ripple phi tuyen');
% Gia tri extrapval=0 dat nen den o toa do nguon nam ngoai anh.
