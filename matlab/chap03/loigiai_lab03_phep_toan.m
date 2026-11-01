%% LOI GIAI LAB 3 - PHEP TOAN MA TRAN VA THEO PHAN TU
clear; clc;
A = [1 2; 3 4];
B = [5 6; 7 8];
C = A * B;          % [19 22; 43 50]
D = A .* B;         % [5 12; 21 32]
E = A .^ 2;         % [1 4; 9 16]
F = A > 2;          % [false false; true true]
disp('A*B ='); disp(C);
disp('A.*B ='); disp(D);
disp('A.^2 ='); disp(E);
disp('A>2 ='); disp(F);
