% this program is for impulse noise(salt & pepper) addition and removal
% using median and adaptive median filters
clear;
close all;
I = imread('flower1.jpg');
I = rgb2gray(I);
J = imread('flower2.jpg');
J = rgb2gray(J);
figure, imshow(I); title('Original image1');
figure, imshow(J); title('Original image2');
% adding noise
In = imnoise(I,'salt & pepper',0.2);
figure, imshow(In); title('Image1 with noise');
Jn = imnoise(J,'salt & pepper',0.2);
figure, imshow(Jn); title('Image2 with noise');
% median filter
Iout = medfilt2(In, [5 5]);
figure, imshow(Iout); title('Image1 with median filtering');
Jout = medfilt2(Jn, [5 5]);
figure, imshow(Jout); title('Image2 with median filtering');
% adaptive median filtering
Iad = ad_medianfilter(I,7);
figure, imshow(Iad); title('Image 1 with adaptive median filter');
Jad = ad_medianfilter(J,15);
figure, imshow(Jad); title('Image 2 with adaptive median filter');
% end
