%% findFeattester
%%
clear all; close all;

% Load Image
% imgRGB = imread('croppedBanana_1.png');
% imgRGB = imread('croppedApple.png');
imgRGB = imread('Picture_6.jpg');
figure, imshow(imgRGB); title('Original RGB');
RGBmap = colormap(figure);
close all;

% Convert to HSV
imgHSV = rgb2hsv(imgRGB);
HSVmap = rgb2hsv(RGBmap);

[Color] = findFeat(imgHSV)