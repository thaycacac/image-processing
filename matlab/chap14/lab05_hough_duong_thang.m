%% LAB 5 - HOUGH TRANSFORM TIM DUONG THANG
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I)==3, G=rgb2gray(I); else, G=I; end
BW=edge(G,'canny');
[H,theta,rho]=hough(BW); peaks=houghpeaks(H,8,'Threshold',ceil(0.3*max(H(:))));
lines=houghlines(BW,theta,rho,peaks,'FillGap',8,'MinLength',15);
figure('Name','Lab 5 - Hough lines');
subplot(1,3,1); imshow(G); title('Anh xam');
subplot(1,3,2); imshow(BW); title('Bien Canny');
subplot(1,3,3); imshow(G); title(sprintf('Hough: %d duong',numel(lines))); hold on;
for k=1:numel(lines)
    xy=[lines(k).point1; lines(k).point2]; plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
end
hold off;
