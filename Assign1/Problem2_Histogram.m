%Program for problem 2:
%reading the under exposed image
Ue = imread('Uexposed.jpg');
% converting to gray scale image
I = rgb2gray(Ue);
% displaying the histogram of the image  
imhist(I); 
title('Under exposed Histogram Original');
% histogram equalization 
I1 = histeq(I,256);
% histogram of output image 
imhist(I1); 
title('Under exposed Histogram After Histogram equalization');
figure, imshow(I); 
title('Original under exposed image');
figure, imshow(I1); 
title('Under exposed image after histogram equalization');
% reading the over exposed image
Oe = imread('Oexposed.jpg');
% converting color image to grey scale
A = rgb2gray(Oe);
% displaying the histogram of the image  
imhist(A); 
title('Over exposed Histogram Original');
% histogram equalization
A1 = histeq(A,256);
% histogram of output image 
imhist(A1); 
title('Over exposed Histogram After Histogram equalization');
figure, imshow(A); 
title('Original over exposed image');
figure, imshow(A1); 
title('Over exposed after histogram equalization');
%end