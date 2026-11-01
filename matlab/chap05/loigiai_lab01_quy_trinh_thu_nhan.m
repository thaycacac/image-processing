%% LOI GIAI LAB 1 - QUY TRINH THU NHAN ANH
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'statue.png'));
figure; imshow(I); title('Anh phan xa tu vat the duoc chieu sang');
fprintf('He thong: nguon sang -> canh/vat -> ong kinh -> cam bien -> ADC -> anh so.\n');
fprintf('Anh X-quang minh hoa hap thu; ngoi sao/bong den minh hoa phat xa.\n');
