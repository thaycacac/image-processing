%% LOI GIAI LAB 4 - ALIASING VA NYQUIST
clear; close all; clc;
N = 256; [x,~] = meshgrid(0:N-1,0:N-1);
pattern = 0.5 + 0.5*cos(2*pi*x/8); steps = [1 2 4 8];
figure('Name','Aliasing');
for k = 1:numel(steps)
    s = steps(k); subplot(2,2,k);
    imshow(pattern(1:s:end,1:s:end)); title(sprintf('Buoc lay mau %d',s));
end
