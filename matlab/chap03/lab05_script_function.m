%% LAB 5 - SCRIPT VA FUNCTION
% File nay la script demo. Function tinh_trung_binh_anh.m nam cung thu muc.
clear; clc;

anh = [10 20 30; 40 50 60];

% Goi function voi anh lam dau vao; ket qua duoc tra ve trong tb.
tb = tinh_trung_binh_anh(anh);
fprintf('Gia tri trung binh = %.2f\n', tb);

% Function dung mean(double(anh(:))) de tinh trung binh tren moi pixel.
% Thu thay anh bang ma tran khac va chay lai de xem ket qua thay doi.
