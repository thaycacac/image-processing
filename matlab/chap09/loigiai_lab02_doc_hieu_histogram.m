%% LOI GIAI LAB 2 - DOC HISTOGRAM
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','..','..','Practice','lenna.tif')));
J={I,.45*I,min(.45+.55*I,1),.4+.2*I}; figure;
for k=1:4
    subplot(4,2,2*k-1); imshow(J{k});
    subplot(4,2,2*k); imhist(J{k});
end
fprintf('Histogram invariance to flip: %d\n',isequal(imhist(I),imhist(fliplr(I))));
