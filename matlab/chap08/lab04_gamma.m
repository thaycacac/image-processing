%% LAB 4 - BIEN DOI LUY THUA (GAMMA)
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = im2double(imread(fullfile(scriptDir, '..', 'data', 'lenna.tif')));
gammas = [0.5 1 2];
figure('Name','Lab 4 - Gamma');
for k = 1:numel(gammas)
    g = gammas(k);
    % imadjust voi gamma<1 lam sang; gamma>1 lam toi anh double [0,1].
    J = imadjust(I,[],[],g);
    subplot(1,3,k); imshow(J); title(sprintf('gamma = %.1f',g));
end
% Ve mapping curve de thay gamma lam thay doi do cong cua phep bien doi.
r = linspace(0,1,256);
figure('Name','Lab 4 - Mapping curves'); hold on;
for g = gammas, plot(r,r.^g,'LineWidth',2); end
grid on; axis square; xlabel('r'); ylabel('s');
legend('gamma=0.5','gamma=1','gamma=2','Location','northwest');
