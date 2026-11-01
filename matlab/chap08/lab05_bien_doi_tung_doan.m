%% LAB 5 - CONTRAST STRETCHING VA GRAY-LEVEL SLICING
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', '..', '..', 'Practice', 'lenna.tif')));

% Piecewise-linear stretch: giu vung toi toi, gian vung trung gian, nen vung sang.
r1 = 0.25; r2 = 0.75; s1 = 0.10; s2 = 0.90;
J = zeros(size(I));
low = I <= r1; mid = I > r1 & I <= r2; high = I > r2;
J(low) = (s1/r1) * I(low);
J(mid) = s1 + (s2-s1)/(r2-r1) * (I(mid)-r1);
J(high) = s2 + (1-s2)/(1-r2) * (I(high)-r2);

% Gray-level slicing lam noi bat pixel trong dai muc xam da chon.
sliceMask = I >= 0.45 & I <= 0.65;
sliceBlack = zeros(size(I)); sliceBlack(sliceMask) = 1;
sliceKeep = I; sliceKeep(sliceMask) = 1;

figure('Name','Lab 5 - Piecewise transforms');
subplot(2,3,1); imshow(I); title('Anh goc');
subplot(2,3,2); imshow(J); title('Contrast stretch tung doan');
subplot(2,3,3); imshow(sliceMask); title('Mask muc xam [0.45,0.65]');
subplot(2,3,4); imshow(sliceBlack); title('Slicing: nen ve den');
subplot(2,3,5); imshow(sliceKeep); title('Slicing: giu nen');
subplot(2,3,6); plot([0 r1 r2 1],[0 s1 s2 1],'o-','LineWidth',2); grid on;
xlabel('r'); ylabel('s'); title('Ham bien doi tung doan'); axis square;
