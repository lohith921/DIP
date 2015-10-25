% Matlab code for problem 3-Noise Addition and removal
% defining 3x3 averaging filter
h = ones(3,3)/9;
% defining 5x5 averaging filter
h5 = ones(5,5)/25;
% Creating the gaussian filter with size = [3 3] and sigma = 1
Gauss3 = fspecial('gaussian',[3 3],1);
% Creating the gaussian filter with size = [5 5] and sigma = 1
Gauss5 = fspecial('gaussian',[5 5],1);
%-------------------------------------------------------------------------%
% reading the input image
Oe = imread('Oexposed.jpg');
% converting to gray image
I = rgb2gray(Oe);
% adding Gaussian noise with default mean values
I1 = imnoise(I,'gaussian');
figure, imshow(I1); title('Oexposed image with Gaussian Noise');

% filtering using 3x3 filter
I2 = imfilter(I1,h); 
figure, imshow(I2); title('Oexposed image(Gauss Noise) 3x3 Average filter');

% filtering using 5x5 filter
I3 = imfilter(I1,h5); 
figure, imshow(I3); title('Oexposed image(Gauss Noise) 5x5 Average filter');

% filtering using 3x3 Gaussian filter
I4 = imfilter(I1,Gauss3,'same');
figure, imshow(I4); title('Oexposed image(Gauss Noise) 3x3 Gauss filter');

% filtering using 5x5 Gaussian filter
I5 = imfilter(I1, Gauss5,'same');
figure, imshow(I5); title('Oexposed image(Gauss Noise) 5x5 Gauss filter');

%I6 = imnoise(I,'salt & pepper',0.05);
%figure, imshow(I6); title('Oexposed image with Salt & pepper Noise');

% filtering using 3x3 filter
%I7 = imfilter(I6,h); 
%figure, imshow(I7); title('Oexposed image(salt & pepper) 3x3 Average filter');

% filtering using 5x5 filter
%I8 = imfilter(I6,h5); 
%figure, imshow(I8); title('Oexposed image(salt & pepper) 5x5 Average filter');

% filtering using 3x3 Gaussian filter
%I9 = imfilter(I6,Gauss3,'same');
%figure, imshow(I9); title('Oexposed image(salt & pepper) 3x3 Gauss filter');

% filtering using 5x5 Gaussian filter
%%figure, imshow(I10); title('Oexposed image(salt & pepper) 5x5 Gauss filter');
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
J3 = imfilter(J,Gauss3,'same');
figure, imshow(J3); title('Oexposed image(Gauss: M=100, v=0.05) 3x3 Gauss filter');

% filtering using 5x5 Gaussian filter
J4 = imfilter(J, Gauss5, 'same');
figure, imshow(J4); title('Oexposed image(Gauss: M=100, v=0.05) 5x5 Gauss filter');
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
A4 = imfilter(A1,Gauss3,'same');
imshow(A4); title('Uexposed image with 3x3 Gaussian filter');

% Filtering using Gauss 5x5
A5 = imfilter(A1,Gauss5,'same');
imshow(A5); title('Uexposed image with 5x5 Gaussian filter');
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
B3 = imfilter(B,Gauss3,'same');
figure, imshow(B3); title('Uexposed image(Gauss: M=100, v=0.05) 3x3 Gauss filter');

% filtering using 5x5 Gaussian filter
B4 = imfilter(B, Gauss5, 'same');
figure, imshow(B4); title('Uexposed image(Gauss: M=100, v=0.05) 5x5 Gauss filter');
%-------------------------------------------------------------------------%
% end

