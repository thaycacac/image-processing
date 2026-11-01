%% LAB 5 - PHEP LOGIC TREN MASK NHI PHAN
clear; close all; clc;
[x,y] = meshgrid(1:160,1:120);
% Hai mask hinh tron giao nhau mot phan.
maskA = (x-65).^2 + (y-60).^2 <= 38^2;
maskB = (x-100).^2 + (y-60).^2 <= 38^2;

% AND = phan giao; OR = hop; XOR = thuoc dung mot trong hai; NOT = dao mask.
maskAnd = maskA & maskB;
maskOr = maskA | maskB;
maskXor = xor(maskA,maskB);
maskNotA = ~maskA;

figure('Name','Lab 5 - Logic mask');
subplot(2,3,1); imshow(maskA); title('Mask A');
subplot(2,3,2); imshow(maskB); title('Mask B');
subplot(2,3,3); imshow(maskAnd); title('A AND B');
subplot(2,3,4); imshow(maskOr); title('A OR B');
subplot(2,3,5); imshow(maskXor); title('A XOR B');
subplot(2,3,6); imshow(maskNotA); title('NOT A');

fprintf('A AND B: %d pixel; A OR B: %d pixel; A XOR B: %d pixel.\n', ...
    nnz(maskAnd), nnz(maskOr), nnz(maskXor));
