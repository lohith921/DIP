% matlab code for problem 3, segmentation through various methods.
I = imread('building.jpg');
I = rgb2gray(I);
%lets define threshold
I1=global_Thresholding(I,50);
figure, imshow(I); title('original image');
figure, imshow(I1); title('Segmented image using global thresholding');
