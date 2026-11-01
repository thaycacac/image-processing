%% LOI GIAI LAB 1 - HISTOGRAM
clear; close all; clc;
I=uint8([0 0 1 1;1 2 2 2;3 3 3 3]);
levels=0:3; counts=arrayfun(@(v)sum(I(:)==v),levels);
disp([levels;counts]);
figure; subplot(1,2,1); imagesc(I); axis image; colormap gray; title('Anh');
subplot(1,2,2); bar(levels,counts); xlabel('Gray level'); ylabel('Count');
