clear all;
I=imread('building.jpg');
I1=rgb2gray(I);
I2=edge(I1,'Roberts');
figure, imshow(I2); title('Building with Roberts edge detection');
I2=edge(I1,'Sobel');
figure, imshow(I2); title('Building with Sobel edge detection');
I2=edge(I1,'Canny');
figure, imshow(I2); title('Building with Canny edge detection');