%% LAB 1 - QUY TRINH THU NHAN ANH
clear; close all; clc;
% Mo hinh: nguon sang -> vat the -> ong kinh -> cam bien -> so hoa.
scriptDir = fileparts(mfilename('fullpath'));
imageFile = fullfile(scriptDir, '..', '..', '..', 'Practice', 'statue.png');
I = imread(imageFile);
fprintf('Anh statue.png co size %s, kieu %s.\n', mat2str(size(I)), class(I));
fprintf('Day la anh phan xa: camera ghi nhan anh sang phan xa tu vat duoc chieu sang.\n');
fprintf('Ngôi sao/bong den minh hoa anh phat xa; anh X-quang minh hoa anh hap thu.\n');
% Thieu sang co the tang nhieu; lay mau thap lam mat chi tiet; it bit lam giam muc xam.
figure('Name','Lab 1 - Anh thu nhan'); imshow(I); title('Anh mau phan xa');
