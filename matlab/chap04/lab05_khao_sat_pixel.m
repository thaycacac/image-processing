%% LAB 5 - KHAO SAT PIXEL VA PROFILE
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif'));
if size(I,3) == 3, Igray = rgb2gray(I); else, Igray = I; end

% Chi so MATLAB la (row,column); toa do do hoa (x,y)=(cot,hang).
row = 120; col = 160;
pixelValue = Igray(row,col);
fprintf('Pixel hang %d, cot %d co muc xam %d.\n', row, col, pixelValue);

% impixel nhan x=cot truoc, y=hang sau; co the doc nhieu diem.
xy = [col row; 100 100; 200 150];
values = impixel(Igray, xy(:,1), xy(:,2));
disp('Gia tri cac pixel tai toa do [x y]:'); disp([xy values]);

% improfile lay mau doc theo duong noi cac toa do (x,y).
x = [40 220]; y = [80 180];
[cx, cy, profile] = improfile(Igray, x, y, 100); %#ok<ASGLU>
figure('Name','Lab 5 - Khao sat anh');
subplot(1,2,1); imshow(Igray); hold on;
plot(x, y, 'r-', 'LineWidth', 2); plot(x, y, 'yo', 'MarkerFaceColor','y');
title('Duong lay mau tren anh');
subplot(1,2,2); plot(profile, 'b-'); grid on;
xlabel('Mau doc theo duong'); ylabel('Muc xam'); title('Intensity profile');

% Bo comment de mo cong cu tuong tac cua Image Processing Toolbox.
% imtool(Igray);
