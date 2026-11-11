%% LOI GIAI LAB 5 - PIECEWISE TRANSFORM
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath'));
I=im2double(imread(fullfile(scriptDir,'..','data','lenna.tif')));
r1=.25; r2=.75; s1=.1; s2=.9; J=zeros(size(I));
a=I<=r1; b=I>r1&I<=r2; c=I>r2;
J(a)=s1/r1*I(a); J(b)=s1+(s2-s1)/(r2-r1)*(I(b)-r1);
J(c)=s2+(1-s2)/(1-r2)*(I(c)-r2);
figure; subplot(1,2,1); imshow(I); title('Original');
subplot(1,2,2); imshow(J); title('Piecewise contrast stretch');
