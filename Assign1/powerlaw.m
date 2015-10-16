% This is for Power-Law Transform 
%for gamma value less than 1 we get Bright image
%for gamma value greater than 1 we get Dark image
%RGB=imread('Uexposed.jpg');
RGB=imread('Oexposed.jpg');
% RGB to gray
I=rgb2gray(RGB);
% Change to double
I=im2double(I);
% computing size m,n 
[m n] = size(I);
% Computing s = c * (r ^ gamma) where r and gamma are positive constants 
c = 2;
%gamma values
g1=0.3;
g2=3.0;
for p = 1 : m
    for q = 1 : n
        I3(p,q) = c * I(p,q).^g1; 
        I4(p,q) = c * I(p,q).^g2;
    end
end
figure, imshow(I3);title('Power-law transformation Gamma=0.3');
figure, imshow(I4);title('Power-law transformation Gamma=3');
