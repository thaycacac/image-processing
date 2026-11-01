%% LOI GIAI LAB 4 - TAO MANG VA TINH TOAN CO BAN
clear; clc;
Z = zeros(3,4);
O = ones(3,4);
I = eye(3);
R = rand(4,5);
M = [1 2 3; 4 5 6];
tongM = sum(M(:));
trungBinhM = mean(M(:));
disp(Z); disp(O); disp(I); disp(R);
fprintf('Tong M = %g, trung binh M = %g\n', tongM, trungBinhM);
