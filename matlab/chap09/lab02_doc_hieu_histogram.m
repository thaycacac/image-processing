%% LAB 2 - DOC HIEU HISTOGRAM
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif')));
Idark = 0.45 * I;
Ibright = min(0.45 + 0.55*I,1);
IlowContrast = 0.4 + 0.2*I;
imgs = {I,Idark,Ibright,IlowContrast};
names = {'Goc','Toi','Sang','Tuong phan thap'};
figure('Name','Lab 2 - Doc histogram');
for k = 1:4
    subplot(4,2,2*k-1); imshow(imgs{k}); title(names{k});
    subplot(4,2,2*k); imhist(imgs{k}); title(['Histogram - ' names{k}]);
end
% Lat ngang doi vi tri pixel nhung khong doi tan suat cac muc xam.
Iflip = fliplr(I);
fprintf('Histogram goc va lat ngang co giong nhau? %d\n',isequal(imhist(I),imhist(Iflip)));
% Histogram khong the cho biet vat the nam o dau trong anh.
