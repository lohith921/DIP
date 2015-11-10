% matlab code for problem 3, segmentation through various methods.
% read all the input files
I = imread('building.jpg');
J = imread('object.jpg');
Z = imread('indoor.jpg');
% converting all to gray
I1 = rgb2gray(I);
J1 = rgb2gray(J);
Z1 = rgb2gray(Z);
figure, imshow(I); title('Building image');
% global thresholding
I2 = global_Thresholding(I1);
I2 = imresize(I2,0.65);
figure, imshow(I2); title('Building segmented using global thresholding');
J2 = global_Thresholding(J1);
J2 = imresize(J2,0.65);
figure, imshow(J2); title('Object segmented using global thresholding');
Z2 = global_Thresholding(Z1);
Z2 = imresize(Z2,0.65);
figure, imshow(Z2); title('Indoor segmented using global thresholding');
% end of global thresholding.
% Otsu's method of segmentation
level = graythresh(I1);
I3 = im2bw(I1,level);
I3 = imresize(I3,0.65);
figure, imshow(I3); title('Building segmented using Otsus method');
level = graythresh(J1);
J3 = im2bw(J1,level);
J3 = imresize(J3,0.65);
figure, imshow(J3); title('Object segmented using Otsus method');
level = graythresh(Z1);
Z3 = im2bw(Z1,level);
Z3 = imresize(Z3,0.65);
figure, imshow(Z3); title('Indoor segmented using Otsus method');
% end of otsu's method segmentation 
% variable thresholding based on local mean and variance
I4 = variable_thresholding(I1);
I4 = imresize(I4,0.65);
figure, imshow(I4); title('Building segmented using variable thresholding');
J4 = variable_thresholding(J1);
J4 = imresize(J4,0.65);
figure, imshow(J4); title('Object segmented using variable thresholding');
Z4 = variable_thresholding(Z1);
Z4 = imresize(Z4,0.65);
figure, imshow(Z4); title('Indoor segmented using variable thresholding');
% end of program.

