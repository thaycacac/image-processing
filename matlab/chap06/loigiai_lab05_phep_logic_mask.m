%% LOI GIAI LAB 5 - PHEP LOGIC TREN MASK
clear; close all; clc;
[x,y] = meshgrid(1:160,1:120);
A = (x-65).^2+(y-60).^2<=38^2;
B = (x-100).^2+(y-60).^2<=38^2;
figure; subplot(2,2,1); imshow(A); title('A');
subplot(2,2,2); imshow(B); title('B');
subplot(2,2,3); imshow(A&B); title('AND');
subplot(2,2,4); imshow(A|B); title('OR');
fprintf('Counts: AND %d, OR %d, XOR %d\n',nnz(A&B),nnz(A|B),nnz(xor(A,B)));
