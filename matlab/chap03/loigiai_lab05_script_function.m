%% LOI GIAI LAB 5 - SCRIPT VA FUNCTION
clear; clc;
anh = [10 20 30; 40 50 60];
tb = tinh_trung_binh_anh(anh);
fprintf('Gia tri trung binh = %.2f\n', tb); % 35.00

% Ham rieng nam trong tinh_trung_binh_anh.m. Vi du noi dung ham:
% function tb = tinh_trung_binh_anh(anh)
%     tb = mean(double(anh(:)));
% end
