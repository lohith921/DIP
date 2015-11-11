% This program reads an input image and calls different contrast enhancement methods
Input = imread('');
Input = rgb2gray(Input);
figure, imshow(Input); title('Original Image');
Iwthe = wthe(Input, 250, 10, 2);
figure, imshow(Iwthe); title('Image enhanced with WTHE');
Ibubo = bubo(Input);
figure, imshow(Ibubo); title('Image enhanced with BUBO');
Ibbhe = bbhe(Input);
figure, imshow(Ibbhe); title('Image enhanced with BBHE');
Immbe = mmbebhe(Input);
figure, imshow(Immbe); title('Image enhanced with MMBEBHE');
% end
