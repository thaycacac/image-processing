%% LAB 6 - DANG KY ANH BANG UOC LUONG TINH TIEN
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
fixed = im2double(imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif')));

% Tao anh moving lech biet truoc: x sang phai 12 pixel, y xuong 8 pixel.
moving = imtranslate(fixed,[12 8],'OutputView','same');
% imregcorr tim phep bien doi can moving ve fixed; gioi han chi tịnh tien.
tform = imregcorr(moving,fixed,'translation');
registered = imwarp(moving,tform,'OutputView',imref2d(size(fixed)));

beforeError = mean(abs(fixed(:)-moving(:)));
afterError = mean(abs(fixed(:)-registered(:)));
fprintf('Sai khac trung binh truoc can chinh: %.5f\n',beforeError);
fprintf('Sai khac trung binh sau can chinh: %.5f\n',afterError);
disp('Ma tran bien doi uoc luong:'); disp(tform.T);

figure('Name','Lab 6 - Dang ky anh');
subplot(1,3,1); imshow(fixed); title('Fixed');
subplot(1,3,2); imshow(moving); title('Moving bi dich');
subplot(1,3,3); imshow(registered); title('Moving da dang ky');
% Dang ky anh la tim bien doi de cac vat/chi tiet tuong ung trung nhau.
