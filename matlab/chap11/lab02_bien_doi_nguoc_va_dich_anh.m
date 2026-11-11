%% LAB 2 - BIEN DOI NGUOC VA TINH CHAT DICH
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));

% Bien doi nguoc phai tai tao lai anh goc (sai so chi do lam tron so).
F = fft2(I);
Ireconstructed = real(ifft2(F));
reconstructionError = max(abs(I(:)-Ireconstructed(:)));

% DFT cua anh dich vong circshift co bien do gan nhu khong doi, pha thay doi.
Ishift = circshift(I,[40 25]);
Foriginal = fftshift(fft2(I));
Fshifted = fftshift(fft2(Ishift));
magnitudeDifference = max(abs(abs(Foriginal(:))-abs(Fshifted(:))));

fprintf('Sai so tai tao toi da: %.3g\n',reconstructionError);
fprintf('Sai khac bien do pho sau dich: %.3g\n',magnitudeDifference);
figure('Name','Lab 2 - Inverse and shift');
subplot(2,2,1); imshow(I); title('Anh goc');
subplot(2,2,2); imshow(Ireconstructed); title('IFFT(FFT(I))');
subplot(2,2,3); imshow(Ishift); title('Anh dich vong');
subplot(2,2,4); imshow(log(1+abs(Fshifted)),[]); title('Pho cua anh dich');
% DFT shift property: translation changes phase, not the magnitude spectrum.
