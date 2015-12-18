% This program reads an input image and calls different contrast
% enhancement methods
prompt = 'Please provide the name of image file';
filename = input(prompt,'s');
Input = imread(filename);
%Input = rgb2gray(Input);
%Input = imresize(Input, [320 240]);
% Lets try brightness preserving bihistogram equalization
% subplot(3,2,1), imshow(Input); title('Original');
% subplot(3,2,2), imhist(Input); title('Histogram');
% Iout = bbhe(Input);
% subplot(3,2,3), imshow(Iout); title('BBHE');
% subplot(3,2,4), imhist(Iout); title('Histogram');
% I = histeq(Input);
% subplot(3,2,5), imshow(I); title('HE');
% subplot(3,2,6), imhist(I); title('Histogram');
% end
% subplot(3,2,1), imshow(Input); title('Original');
% subplot(3,2,2), imhist(Input); title('Histogram');
% Iout = dsihe(Input,240);
% subplot(3,2,3), imshow(Iout); title('DSIHE');
% subplot(3,2,4), imhist(Iout); title('Histogram');
% I = histeq(Input);
% subplot(3,2,5), imshow(I); title('HE');
% subplot(3,2,6), imhist(I); title('Histogram');
% end
% subplot(3,2,1), imshow(Input); title('Original');
% subplot(3,2,2), imhist(Input); title('Histogram');
% Iout = bubo(Input,30);
% subplot(3,2,3), imshow(Iout); title('BUBO');
% subplot(3,2,4), imhist(Iout); title('Histogram');
% I = histeq(Input);
% subplot(3,2,5), imshow(I); title('HE');
% subplot(3,2,6), imhist(I); title('Histogram');
% end
subplot(3,2,1), imshow(Input); title('Original');
subplot(3,2,2), imhist(Input); title('Histogram');
% Iout = wthe(<brain>,0.875);
% Iout = wthe(<Oexposed>,0.75);
% Iout = wthe(<hare>,0.875);
Iout = wthe(Input,0.5);
subplot(3,2,3), imshow(Iout); title('WTHE');
subplot(3,2,4), imhist(Iout); title('Histogram');
I = histeq(Input);
subplot(3,2,5), imshow(I); title('HE');
subplot(3,2,6), imhist(I); title('Histogram');
% end