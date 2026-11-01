%% LAB 4 - TAO MANG VA TINH TOAN CO BAN
clear; clc;

% zeros, ones va eye tao cac ma tran co cau truc dac biet.
Z = zeros(3,4);
O = ones(3,4);
I = eye(3);
% rand tao so thuc phan bo deu trong mien tu 0 den 1.
R = rand(4,5);
% M(:) gom moi phan tu thanh vector cot de tinh tren toan ma tran.
M = [1 2 3; 4 5 6];
tongM = sum(M(:));
trungBinhM = mean(M(:));

disp('zeros(3,4):'); disp(Z);
disp('ones(3,4):'); disp(O);
disp('eye(3):'); disp(I);
disp('rand(4,5):'); disp(R);
fprintf('Tong tat ca phan tu M = %g\n', tongM);
fprintf('Trung binh tat ca phan tu M = %g\n', trungBinhM);
