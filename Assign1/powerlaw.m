% Program demonstrates the power law transformation.
Ue = imread('Uexposed.jpg');
Oe = imread('Oexposed.jpg');
% RGB to gray
I = rgb2gray(Ue);
J = rgb2gray(Oe);
% Change to double
I = im2double(I);
J = im2double(J);
% computing size m,n 
[m1 n1] = size(I);
[m2 n2] = size(J);
% Computing s = c * (r ^ gamma) where r and gamma are positive constants 
c = 2;
% gamma values
g1=0.3;
g2=3.0;
for p = 1 : m1
    for q = 1 : n1
        I3(p,q) = c * I(p,q).^g1; 
        I4(p,q) = c * I(p,q).^g2;
    end
end
figure, imshow(I3);title('Under exposed,Powerlaw transformation Gamma=0.3');
figure, imshow(I4);title('Under exposed,Power-law transformation Gamma=3');
for p = 1 : m2
    for q = 1 : n2
        J3(p,q) = c * J(p,q).^g1; 
        J4(p,q) = c * J(p,q).^g2;
    end
end
figure, imshow(J3);title('Over exposed,Powerlaw transformation Gamma=0.3');
figure, imshow(J4);title('Over exposed,Power-law transformation Gamma=3');
% end