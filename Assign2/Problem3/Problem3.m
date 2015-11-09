% matlab code for problem 3, segmentation through various methods.
% read all the input files
I = imread('building.jpg');
J = imread('object.jpg');
Z = imread('indoor.jpeg');
% converting all to gray
I1 = rgb2gray(I);
J1 = rgb2gray(J);
Z1 = rgb2gray(Z);
figure, imshow(I); title('Building image');
% global Thresholding with threshold=100
I2 = global_Thresholding(I1,100);
figure, imshow(I2); title('Building segmented using global thresholding');
J2 = global_Thresholding(J1,100);
figure, imshow(J2); title('Object segmented using global thresholding');
Z2 = global_Thresholding(Z1,100);
figure, imshow(Z2); title('Indoor segmented using global thresholding');
% end of global thresholding.
% Otsu's method of segmentation
level = graythresh(I1);
I3 = im2bw(I1,level);
figure, imshow(I3); title('Building segmented using Otsus method');
level = graythresh(J1);
J3 = im2bw(J1,level);
figure, imshow(J3); title('Object segmented using Otsus method');
level = graythresh(Z1);
Z3 = im2bw(Z1,level);
figure, imshow(Z3); title('Indoor segmented using Otsus method');
% end of otsu's method
% segmentation 
