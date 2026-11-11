%% LAB 1 - FFT 2D VA PHO TAN SO
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));

% FFT 2D chuyen anh tu mien khong gian sang mien tan so.
F = fft2(I);
Fc = fftshift(F);               % Dua tan so thap ve tam de de quan sat.
magnitude = abs(Fc);            % Bien do pho.
logSpectrum = log(1 + magnitude); % Nen dynamic range de hien thi ro.
phaseSpectrum = angle(Fc);      % Pha mang thong tin vi tri/cau truc.

fprintf('Kich thuoc anh va pho: %s, so phan tu F=%d\n',mat2str(size(I)),numel(F));
figure('Name','Lab 1 - Fourier spectrum');
subplot(2,2,1); imshow(I); title('Anh trong mien khong gian');
subplot(2,2,2); imshow(logSpectrum,[]); title('log(1 + |FFT|)');
subplot(2,2,3); imshow(magnitude,[]); title('Bien do pho');
subplot(2,2,4); imshow(phaseSpectrum,[]); title('Pha pho');
