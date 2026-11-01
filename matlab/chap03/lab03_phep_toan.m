%% LAB 3 - PHEP TOAN MA TRAN VA THEO PHAN TU
clear; clc;
A = [1 2; 3 4];
B = [5 6; 7 8];

% Nhan ma tran: hang ket qua theo A, cot ket qua theo B.
C = A * B;
% Nhan tung cap phan tu cung vi tri; dau cham tao ra khac biet quan trong.
D = A .* B;
% .^ ap dung luy thua rieng cho tung phan tu.
E = A .^ 2;
% So sanh tung phan tu tao ra ma tran logical.
F = A > 2;

disp('A * B (nhan ma tran):'); disp(C);
disp('A .* B (nhan theo phan tu):'); disp(D);
disp('A .^ 2 (binh phuong tung phan tu):'); disp(E);
disp('A > 2 (ket qua logical):'); disp(F);

% C khac D: A*B tinh tong tich theo hang-cot; A.*B nhan cac o cung vi tri.
