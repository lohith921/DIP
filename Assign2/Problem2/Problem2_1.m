clear all;
% reading the images
I = imread('building.jpg');
J = imread('object.jpg');
Z = imread('indoor.jpg');
% convert to gray scale
I1 = rgb2gray(I);
J1 = rgb2gray(J);
Z1 = rgb2gray(Z);
% Extract edges
E1 = edge(I1,'Canny');
E2 = edge(J1,'Canny');
E3 = edge(Z1,'Canny');
% building image
% Display original image
figure, imshow(E1); title('Building image');
[H, T, R] = hough(E1, 'RhoResolution',1.0,'ThetaResolution',1.0);
imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,...
    'InitialMagnification','fit');
title('Hough Transform of Building image');
axis on, axis normal;
colormap(hot);
% object image
% Display original image
figure, imshow(E2); title('Object image');
[H1, T1, R1] = hough(E2, 'RhoResolution',1.0,'ThetaResolution',1.0);
% Display the Hough matrix
imshow(imadjust(mat2gray(H1)),'XData',T1,'YData',R1,...
    'InitialMagnification','fit');
 title('Hough Transform of Object image');
 axis on, axis normal;
 colormap(hot);
 % indoor image
% Display original image
figure, imshow(E3); title('Indoor image');
[H2, T2, R2] = hough(E3, 'RhoResolution',1.0,'ThetaResolution',1.0);
% [H2, T2, R2] = hough(E3, 'Theta', -60:1:-20);
% Display the Hough matrix
imshow(imadjust(mat2gray(H2)),'XData',T2,'YData',R2,...
    'InitialMagnification','fit');
 title('Hough Transform of Indoor image');
 axis on, axis normal;
 colormap(hot);
 % Display the Hough matrix
% subplot(2,1,2);
% [H, T, R] = hough(BW);
