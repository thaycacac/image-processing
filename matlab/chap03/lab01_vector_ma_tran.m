%% LAB 1 - VECTOR, MA TRAN VA CHI SO
clear; clc;
A = [2 4 6; 1 3 5; 7 8 9];

% size tra ve so hang va so cot cua ma tran.
kichThuoc = size(A);
fprintf('A co %d hang va %d cot.\n', kichThuoc(1), kichThuoc(2));

% Chi so MATLAB bat dau tu 1; A(2,3) la hang 2, cot 3.
p = A(2,3);
fprintf('A(2,3) = %d\n', p);

% Dau hai cham chon tat ca cac cot hoac tat ca cac hang.
hangMot = A(1,:);
cotHai = A(:,2);
disp('Hang 1 cua A:'); disp(hangMot);
disp('Cot 2 cua A:'); disp(cotHai);

% Gan gia tri moi vao mot vi tri cua ma tran.
A(3,1) = 99;
disp('A sau khi doi phan tu (3,1) thanh 99:'); disp(A);

% Cu phap bat dau:buoc:ket_thuc tao day so cach deu.
v = 2:2:12;
disp('Cac so chan tu 2 den 12:'); disp(v);
