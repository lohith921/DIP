% Matlab code for problem 4-Laplacian Enhancement
% defining the simple laplacian filter
lap1 = [0 1 0; 1 -4 1; 0 1 0];
% laplacian filter involving the diagonal pixels as well
lap2 = [1 1 1; 1 -8 1; 1 1 1];
% Creating the gaussian filter with size = [3 3] and sigma = 1
Gauss3 = fspecial('gaussian',[3 3],1);
% lap2 with negation
lap3 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
Ue = imread('Uexposed1.jpg');
I = rgb2gray(Ue);
% filtering using gaussian filter 
I = imfilter(I,Gauss3,'same');
% applying the Laplacian operator
I1 = imfilter(I,lap1,'conv');
I1 = I - I1;
I2 = imfilter(I,lap2,'conv');
I2 = I - I2;
%I3 = imfilter(I,lap3);
figure, imshow(I); title('Uexposed Original');
figure, imshow(I1); title('Uexposed filtered using Laplacian');
figure, imshow(I2); title('Uexposed filtered using Laplacian diagonal');
%figure, imshow(I3); title('Uexposed filtered using Laplacian diagonal inverse');
Oe = imread('Oexposed.jpg');
A = rgb2gray(Oe);
A = imfilter(A,Gauss3,'same');
A1 = imfilter(A,lap1,'conv');
A1 = A - A1;
A2 = imfilter(A,lap2,'conv');
A2 = A - A2;
figure, imshow(A); title('Over exposed Original');
figure, imshow(A1); title('Over exposed using Laplacian filter');
figure, imshow(A2); title('Oexposed using Laplacian filter diagonal');
%end
