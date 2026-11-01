%% BAI 3 - ANH RGB GOM BA KENH
clear; close all; clc;

R = uint8(zeros(60, 80));
G = uint8(zeros(60, 80));
Bblue = uint8(zeros(60, 80));
R(10:50, 10:30) = 255;
G(10:50, 31:55) = 180;
Bblue(10:50, 56:75) = 255;
RGB = cat(3, R, G, Bblue);

% TODO: In kich thuoc RGB va lay gia tri kenh xanh la tai (20,40).

figure('Name','Bai 3 - Anh RGB');
image(RGB); axis image; title('Anh mau RGB tao tu ba kenh');
