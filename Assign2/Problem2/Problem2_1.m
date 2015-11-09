I = imread('image_1_object.jpg');
% convert to gray scale
I = rgb2gray(I);
%Extract edges
BW = edge(I,'Canny');
%[H, T, R] = hough(BW, 'RhoResolution',0.5,'ThetaResolution',0.5);
[H, T, R] = hough(BW);
% Display original image
imshow(BW);
title('Building image');
% Display the Hough matrix
subplot(2,1,2);
imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,...
    'InitialMagnification','fit');
 title('Hough Transform of Building image');
 axis on, axis normal, hold on;
 colormap(hot);
