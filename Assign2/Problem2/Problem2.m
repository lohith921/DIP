RGB = imread('building.jpg');
% convert to gray scale
I = rgb2gray(RGB);

%Extract edges
BW = edge(I,'Canny');
[H, T, R] = hough(BW, 'RhoResolution',0.5,'Theta',-90:0.5:89.5);
% Display original image
subplot(2,1,1);
imshow(RGB);
title('Building image');

% Display the Hough matrix
subplot(2,1,2);
imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,...
    'InitialMagnification','fit');
title('Hough Transform of Building image');
axis on, axis normal, hold on;
%colormap(hot);