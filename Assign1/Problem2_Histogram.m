%Program for problem 2:
clear all
%reading the under exposed image
I=imread('Uexposed.jpg');
% converting to gray scale image
I1=rgb2gray(I);
% displaying the histogram of the image  
imhist(I1); 
title('Under exposed Histogram Original');
% histogram equalization 
J=histeq(I1,256);
% histogram of output image 
imhist(J); 
title('Under exposed Histogram After Histogram equalization');
figure, imshow(I1); 
title('Original under exposed image');
figure, imshow(J); 
title('Under exposed image after histogram equalization');
% reading the over exposed image
A=imread('Oexposed.jpg');
% converting color image to grey scale
A1=rgb2gray(A);
% displaying the histogram of the image  
imhist(A1); 
title('Over exposed Histogram Original');
% histogram equalization
B=histeq(A1,256);
% histogram of output image 
imhist(B); 
title('Over exposed Histogram After Histogram equalization');
figure, imshow(A1); 
title('Original over exposed image');
figure, imshow(B); 
title('Over exposed after histogram equalization');
%end