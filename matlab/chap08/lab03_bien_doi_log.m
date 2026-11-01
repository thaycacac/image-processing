%% LAB 3 - BIEN DOI LOG
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif')));

% Log curve tang tuong doi cac muc toi, dong thoi nen cac muc sang.
c = 20;
J = log(1 + c*I) / log(1 + c);

% Ve ham T(r) de doc anh huong truc tiep len muc xam dau vao.
r = linspace(0,1,256);
s = log(1+c*r)/log(1+c);
figure('Name','Lab 3 - Log transform');
subplot(1,3,1); plot(r,s,'LineWidth',2); axis square; grid on;
xlabel('r'); ylabel('s'); title('Log mapping');
subplot(1,3,2); imshow(I); title('Anh goc');
subplot(1,3,3); imshow(J); title('Sau log');
fprintf('Pixel toi 0.1 -> %.3f; pixel sang 0.9 -> %.3f\n', ...
    log(1+c*.1)/log(1+c),log(1+c*.9)/log(1+c));
