%% LAB 3 - CAN BANG HISTOGRAM QUA CDF
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif'));

% Tinh histogram 256 muc, chuan hoa thanh xac suat va tinh CDF.
h = imhist(I,256);
p = h / numel(I);
cdf = cumsum(p);
% Muc dau vao r=0..255 duoc anh xa thanh muc gan bang round(255*CDF).
mapping = uint8(round(255*cdf));
Jmanual = reshape(mapping(double(I)+1),size(I));
% histeq la ham IPT thuc hien can bang histogram tu dong.
Jmatlab = histeq(I);

figure('Name','Lab 3 - Histogram equalization');
subplot(2,3,1); imshow(I); title('Anh goc');
subplot(2,3,2); imhist(I); title('Histogram goc');
subplot(2,3,3); plot(cdf); grid on; title('CDF'); xlabel('Muc xam');
subplot(2,3,4); imshow(Jmanual); title('Can bang tu CDF');
subplot(2,3,5); imhist(Jmanual); title('Histogram sau can bang');
subplot(2,3,6); imshow(Jmatlab); title('histeq(I)');
fprintf('Trung binh truoc %.2f, sau %.2f (thang 0..255).\n',mean(double(I(:))),mean(double(Jmanual(:))));
