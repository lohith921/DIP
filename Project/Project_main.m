% This program reads an input image and calls different contrast enhancement methods
Input = imread('Uexposed.jpg');
Input = rgb2gray(Input);
%figure, imshow(Input); title('Original Image');
Iout = bbhe(Input);
figure, imshow(Iout); title('Output image');
figure, imhist(Iout);
% Iwthe = wthe(Input, 250, 10, 2);
% figure, imshow(Iwthe); title('Image enhanced with WTHE');
%Ibubo = bubo( Input,150 );
%figure, imshow(Ibubo); title('Image enhanced with BUBO');
% Ibbhe = bbhe(Input);
% figure, imshow(Ibbhe); title('Image enhanced with BBHE');
% Immbe = mmbebhe(Input);
% figure, imshow(Immbe); title('Image enhanced with MMBEBHE');
% end
