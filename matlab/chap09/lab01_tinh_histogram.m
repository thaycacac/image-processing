%% LAB 1 - TINH HISTOGRAM ANH XAM
clear; close all; clc;
% Anh nho de co the tu dem tan suat tung muc xam.
I = uint8([0 0 1 1; 1 2 2 2; 3 3 3 3]);
levels = 0:3; counts = zeros(size(levels));
for k = 1:numel(levels)
    counts(k) = sum(I(:) == levels(k));
end
probability = counts / numel(I);
fprintf('Muc xam: '); disp(levels);
fprintf('So pixel: '); disp(counts);
fprintf('Xac suat: '); disp(probability);
figure('Name','Lab 1 - Histogram');
subplot(1,2,1); imagesc(I); axis image; colormap gray; colorbar; title('Anh toy');
subplot(1,2,2); bar(levels,counts); grid on; xlabel('Muc xam'); ylabel('So pixel'); title('Histogram dem tay');
