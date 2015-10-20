% Matlab code for problem 3-Noise Addition and removal
% defining 3x3 averaging filter
h = ones(3,3)/9;
% defining 5x5 averaging filter
h5 = ones(5,5)/25;
% Creating the gaussian filter with size = [3 3] and sigma = 2
Gauss3 = fspecial('gaussian',[3 3],2);
% Creating the gaussian filter with size = [5 5] and sigma = 2
Gauss5 = fspecial('gaussian',[5 5],2);
%-------------------------------------------------------------------------%
% reading the image
Oe = imread('Oexposed.jpg');
% converting to gray image
I = rgb2gray(Oe);
% adding Gaussian noise with default mean values
I1 = imnoise(I,'gaussian');
figure, imshow(I1); title('Oexposed image with Gaussian Noise');

% filtering using 3x3 filter
I2 = imfilter(I1,h); 
figure, imshow(I2); title('Oexposed image with 3x3 Average filter');

% filtering using 5x5 filter
I3 = imfilter(I1,h5); 
figure, imshow(I3); title('Oexposed image with 5x5 Average filter');

% filtering using 3x3 Gaussian filter
I4 = imfilter(I1,Gauss1,'same');
figure, imshow(I4); title('Oexposed image with 3x3 Gauss filter');

% filtering using 5x5 Gaussian filter
I5 = imfilter(I1, Gauss2, 'same');
figure, imshow(I5); title('Over exposed image with 5x5 Gauss filter');
%-------------------------------------------------------------------------%
% adding Gaussian noise with mean=100 and variance 0.05
J = imnoise(I,'gaussian',100,0.05);
figure, imshow(J); title('Oexposed image with Gaussian Noise; M=100, sigma=0.05');

% filtering using 3x3 averaging filter
J1 = imfilter(J,h); 
figure, imshow(J1); title('Oexposed image(Gauss: M=100, v=0.05) 3x3 Average filter');

% filtering using 5x5 averaging filter
J2 = imfilter(J,h5); 
figure, imshow(J2); title('Oexposed image(Gauss: M=100, v=0.05) 5x5 Average filter');

% filtering using 3x3 Gaussian filter
J3 = imfilter(J,Gauss1,'same');
figure, imshow(J4); title('Oexposed image(Gauss: M=100, v=0.05) 3x3 Gauss filter');

% filtering using 5x5 Gaussian filter
I5 = imfilter(I1, Gauss2, 'same');
figure, imshow(I5); title('Oexposed image(Gauss: M=100, v=0.05) 5x5 Gauss filter');
%-------------------------------------------------------------------------%
% reading the image
A = imread('Uexposed.jpg');
A = rgb2gray(A);
% adding Gaussian noise with default mean values
A1 = imnoise(A,'gaussian');
figure, imshow(A1); title('Uexposed image with Gaussian Noise');
% filtering using 3x3 averaging filter
A2=imfilter(A1,h); 
figure, imshow(A2); title('Uexposed image with 3x3 Average filter');
% filtering using 5x5 averaging filter
A3=imfilter(A1,h5); 
figure, imshow(A3); title('Uexposed image with 5x5 Average filter');

% Filtering using Gauss 3x3
A4 = imfilter(A1,Gauss1,'same');
imshow(A4); title('Uexposed image with 3x3 Gaussian filter');

% Filtering using Gauss 5x5
A5 = imfilter(A1,Gauss2,'same');
imshow(Ig); title('Uexposed image with 5x5 Gaussian filter');
%-------------------------------------------------------------------------%
% adding Gaussian noise with mean=100 and variance 0.05
B = imnoise(A,'gaussian',100,0.05);
figure, imshow(B); title('Uexposed image with Gaussian Noise:M=100, sigma=0.05');

% filtering using 3x3 averaging filter
B1 = imfilter(B,h); 
figure, imshow(B1); title('Uexposed image(Gauss: M=100, v=0.05) 3x3 Average filter');

% filtering using 5x5 averaging filter
B2 = imfilter(B,h5); 
figure, imshow(B2); title('Uexposed image(Gauss: M=100, v=0.05) 5x5 Average filter');

% filtering using 3x3 Gaussian filter
B3 = imfilter(B,Gauss1,'same');
figure, imshow(B3); title('Uexposed image(Gauss: M=100, v=0.05) 3x3 Gauss filter');

% filtering using 5x5 Gaussian filter
B4 = imfilter(B, Gauss2, 'same');
figure, imshow(B4); title('Uexposed image(Gauss: M=100, v=0.05) 5x5 Gauss filter');
%-------------------------------------------------------------------------%
% end

