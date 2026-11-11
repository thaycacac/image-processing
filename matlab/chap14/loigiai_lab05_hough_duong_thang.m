%% LOI GIAI LAB 5 - HOUGH TRANSFORM TIM DUONG THANG
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=imread(fullfile(scriptDir,'..','data','shapes23.png'));
if ndims(I)==3, G=rgb2gray(I); else, G=I; end
BW=edge(G,'canny'); [H,T,R]=hough(BW);
P=houghpeaks(H,8,'Threshold',ceil(.3*max(H(:))));
L=houghlines(BW,T,R,P,'FillGap',8,'MinLength',15);
figure('Name','Solution 5 - Hough transform');
subplot(1,3,1); imshow(BW); title('Canny edges');
subplot(1,3,2); imshow(imadjust(rescale(H)),'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'); ylabel('\rho'); title('Hough accumulator'); axis on; axis normal; hold on;
if ~isempty(P), plot(T(P(:,2)),R(P(:,1)),'s','Color','red'); end; hold off;
subplot(1,3,3); imshow(G); title(sprintf('%d duong phat hien',numel(L))); hold on;
for k=1:numel(L), xy=[L(k).point1;L(k).point2]; plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green'); end
hold off;
