% This program reads an input image and calls different contrast
% enhancement methods
prompt = 'Please provide the name of image file';
filename = input(prompt,'s');
Input = imread(filename);
Input = rgb2gray(Input);
Input = imresize(Input, [320 240]);
% Lets try brightness preserving bihistogram equalization
subplot(2,2,1), imshow(Input); title('original');
subplot(2,2,3), imhist(Input); title('histogram before');
Iout = bbhe(Input);
subplot(2,2,2), imshow(Iout); title('bbhe');
subplot(2,2,4), imhist(Iout); title('histogram after');
% end
%subplot(2,2,1), imshow(Input); title('original');
% subplot(2,2,3), imhist(Input); title('histogram before');
% Iout = wthe(Input,1.5);
% subplot(2,2,2), imshow(Iout); title('wthe with v = 0.8,r = 1.5');
% subplot(2,2,4), imhist(Iout); title('histogram after');
% subplot(2,2,1), imshow(Input); title('original');
% subplot(2,2,3), imhist(Input);
% subplot(2,2,2), imshow(Ibubo); title('enhanced with BUBO');
% subplot(2,2,4), imhist(Ibubo);
% Ibbhe = bbhe(Input);
% figure, imshow(Ibbhe); title('Image enhanced with BBHE');
% mmbebhe is not working
% Immbe = mmbebhe(Input);
% figure, imshow(Immbe); title('Image enhanced with MMBEBHE');
% end
