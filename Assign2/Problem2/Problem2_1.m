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
[H, T, R] = hough(E1, 'RhoResolution',0.5,'ThetaResolution',0.5);
% [H, T, R] = hough(BW);
% Display original image
figure, imshow(E1); title('Building image');
% Display the Hough matrix
subplot(2,1,2);
imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,...
    'InitialMagnification','fit');
 title('Hough Transform of Building image');
 axis on, axis normal;
 % object image
 [H, T, R] = hough(E2, 'RhoResolution',0.5,'ThetaResolution',0.5);
% [H, T, R] = hough(BW);
% Display original image
figure, imshow(E2); title('Object image');
% Display the Hough matrix
subplot(2,1,2);
imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,...
    'InitialMagnification','fit');
 title('Hough Transform of Building image');
 axis on, axis normal;
 % indoor image
 [H, T, R] = hough(E3, 'RhoResolution',0.5,'ThetaResolution',0.5);
% [H, T, R] = hough(BW);
% Display original image
figure, imshow(E3); title('Indoor image');
% Display the Hough matrix
subplot(2,1,2);
imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,...
    'InitialMagnification','fit');
 title('Hough Transform of Building image');
 axis on, axis normal;
 colormap(hot);
