%% LOI GIAI LAB 2 - UOC LUONG NHIEU
clear; close all; clc; rng(1);
P=min(max(.5+.06*randn(256,256),0),1);
fprintf('Mean %.4f, std %.4f\n',mean(P(:)),std(P(:)));
S=imnoise(.5*ones(256,256),'salt & pepper',.08);
figure; subplot(2,2,1); imshow(P); subplot(2,2,2); imhist(P);
subplot(2,2,3); imshow(S); subplot(2,2,4); imhist(S);
