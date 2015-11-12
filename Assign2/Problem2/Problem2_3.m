% function to plot the lines detected by hough transform
clear all;
% reading the images
I = imread('building.jpg');
J = imread('object.jpg');
Z = imread('indoor.jpg');
% convert to gray scale
% b = 'building';
% o = 'object';
% i = 'indoor';
I1 = rgb2gray(I);
J1 = rgb2gray(J);
Z1 = rgb2gray(Z);
Hough_lines(I1);
%
% Hough_lines(J1);
% % 
% Hough_lines(Z1);
% end of program
