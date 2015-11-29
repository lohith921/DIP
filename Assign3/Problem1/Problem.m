% Program for Problem 1
clear;
close all;
I = imread('flower1.jpg');
I = im2double(I);
I = rgb2gray(I);
figure, imshow(I); title('Original Image1');
Process(I);
J = imread('flower2.jpg');
J = im2double(J);
J = rgb2gray(J);
figure, imshow(J); title('Original Image2');
Process(J);
% end