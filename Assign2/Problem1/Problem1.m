clear all;
% read the input image
I = imread('building.jpg');
J = imread('object.jpg');
Z = imread('indoor.jpg');
% converting to gray scale
I1 = rgb2gray(I);
J1 = rgb2gray(J);
Z1 = rgb2gray(Z);
% Roberts edge detection
I2 = edge(I1,'Roberts');
figure, imshow(I2); title('Building with Roberts edge detection');
J2 = edge(J1,'Roberts');
figure, imshow(J2); title('Object with Roberts edge detection');
Z2 = edge(Z1,'Roberts');
figure, imshow(Z2); title('Indoor with Roberts edge detection');
% Sobel edge detection
I3 = edge(I1,'Sobel');
figure, imshow(I3); title('Building with Sobel edge detection');
J3 = edge(J1,'Sobel');
figure, imshow(J3); title('Object with Sobel edge detection');
Z3=edge(Z1,'Sobel');
figure, imshow(Z3); title('Indoor with Sobel edge detection');
%Marr-Hildreth edge detection
I4 = edge(I1,'log');
figure, imshow(I4); title('Building with Marry-Hilderth edge detection');
J4 = edge(J1,'log');
figure, imshow(J4); title('Object with Marry-Hilderth edge detection');
Z5 = edge(Z1,'log');
figure, imshow(I5); title('Indoor with Marry-Hilderth edge detection');
% Canny edge detection
I5 = edge(I1,'Canny');
figure, imshow(I5); title('Building with Canny edge detection');
J5 = edge(J1,'Canny');
figure, imshow(J5); title('Object with Canny edge detection');
Z5 = edge(Z1,'Canny');
figure, imshow(I4); title('Indoor with Canny edge detection');
% end of program
