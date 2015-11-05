% matlab code for problem 3, segmentation through various methods.
I = imread('building.jpg');
I = rgb2gray(I);
% lets threshold=100
% I1=global_Thresholding(I,50);
%I1 = global_Thresholding_1(I,100);
figure, imshow(I); title('original image');
%figure, imshow(I1); title('Segmented image using global thresholding');
% end of global thresholding.
% Otsu's method of segmentation
level = graythresh(I);
J1 = im2bw(I,level);
figure, imshow(J1); title('Segmented image using Otsus method');
%end
