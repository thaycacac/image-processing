%% BAI 6 - NHAN BIET CAC NHOM PHEP XU LY
clear; close all; clc;

I = uint8([0 40 80 120; ...
           30 70 110 150; ...
           60 100 140 180; ...
           90 130 190 255]);

% Hay phan loai tung phep la: phep diem, phep lan can,
% ket hop anh, hay phep trong mien bien doi.
P1 = double(I) + 20;                         % Goi y: doi sang sang tung pixel
P2 = conv2(double(I), ones(3)/9, 'same');     % Goi y: mat na 3x3
P3 = double(I) + double(I);                  % Goi y: dung hai anh
P4 = fft2(double(I));                        % Goi y: Fourier

% TODO: viet phan loai cua P1, P2, P3, P4 vao cac comment ben duoi.
% P1:
% P2:
% P3:
% P4:
