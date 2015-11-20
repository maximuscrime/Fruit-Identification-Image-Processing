function [ clr ] = findFeat(img_rgb)
%Used to detect the color of an object that is already segmented out of the
%background.
%   img = inputted HSV image #x#x3channels as double !!!! object that is segmented out 

%% FIND COLORS 
%initialize
clr = NaN;
img = rgb2hsv(img_rgb);
Edges = [1, 13, 42, 70, 167, 252, 306]; %based on HSV 0-360
img = img*360; %to get HSV into 255 range
[ysize, xsize, ~] = size(img);

imgHue = img(:,:,1);
[N, Bins] = histc(imgHue(:), Edges);
clr = find(N==max(N)) ;

%plot
% tmp = 1:length(Edges);
% figure; bar(tmp,N); grid;

% assignin('base', 'N', N);
assignin('base', 'imgHue',imgHue);
% assignin('base', 'Edges', Edges);
end



