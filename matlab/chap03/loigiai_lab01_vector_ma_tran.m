%% LOI GIAI LAB 1 - VECTOR, MA TRAN VA CHI SO
clear; clc;
A = [2 4 6; 1 3 5; 7 8 9];
kichThuoc = size(A);          % [3 3]
p = A(2,3);                   % 5
hangMot = A(1,:);             % [2 4 6]
cotHai = A(:,2);              % [4; 3; 8]
A(3,1) = 99;
v = 2:2:12;
disp(kichThuoc); disp(p); disp(hangMot); disp(cotHai); disp(A); disp(v);
