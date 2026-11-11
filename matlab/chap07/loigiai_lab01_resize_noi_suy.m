%% LOI GIAI LAB 1 - RESIZE VA NOI SUY
clear; close all; clc;
scriptDir = fileparts(mfilename('fullpath'));
I = imread(fullfile(scriptDir, '..', 'data', 'statue.png'));
methods = {'nearest','bilinear','bicubic'};
figure('Name','Interpolation comparison'); imshow(I); title('Original');
for k=1:3
    J=imresize(I,2,methods{k}); figure; imshow(J); title(methods{k});
end
fprintf('Original %s, resized %s\n',mat2str(size(I)),mat2str(size(J)));
