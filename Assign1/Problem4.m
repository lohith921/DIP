% Matlab code for problem 4-Laplacian Enhancement
% defining the simple laplacial filter
lap1 = [0 1 0; 1 -4 1; 0 1 0];
% laplacian filter involving the diagonal pixels 
lap2 = [1 1 1; 1 -8 1; 1 1 1];
% lap2 with negation
lap3 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
I=imread('Uexposed1.jpg');
I=rgb2gray(I);
I1=imfilter(I,lap1);
I2=imfilter(I,lap2);
%I3 = imfilter(I,lap3);
figure, imshow(I); title('Uexposed Original');
figure, imshow(I1); title('Uexposed filtered using Laplacian');
figure, imshow(I2); title('Uexposed filtered using Laplacian diagonal');
%figure, imshow(I3); title('Uexposed filtered using Laplacian diagonal inverse');
A = imread('Oexposed.jpg');
A = rgb2gray(A);
A1 = imfilter(A,lap1);
A2 = imfilter(A,lap2);
figure, imshow(A); title('Over exposed Original');
figure, imshow(A1); title('Over exposed using Laplacian filter');
figure, imshow(A2); title('Oexposed using Laplacian filter diagonal');
%end
