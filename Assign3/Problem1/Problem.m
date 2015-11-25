% Script for Problem 1
clear;
close all;
I = imread('flower1.jpg');
I = im2double(I);
I = rgb2gray(I);
figure, imshow(I); title('original image1');
Inoise = imnoise(I,'gaussian',0,0.2);
figure, imshow(Inoise); title('Image1 with Gaussian noise');
J = imread('flower2.jpg');
J = im2double(J);
J = rgb2gray(J);
figure, imshow(I); title('Original image2');
Jnoise = imnoise(J,'gauss',0,0.2);
figure, imshow(Jnoise); title('Image2 with Gaussian noise');
% Filtering in frequency domain begins here Lecture #22
[M,N] = size(Inoise);
% padding parameters
P = 2*M;
Q = 2*N;
% padded image
Fp = zeros(P,Q); 
Fp(1:M,1:N) = Inoise;
% figure, imshow(); title('before multiplying');
for i=1:P
    for j=1:Q
        % B = -1^(i+j);
        B = power(-1, (i+j));
        Fp(i,j) = B*Fp(i,j);
    end
end
Itr = fft2(Fp);
% figure, imshow(real(Itr)); title('Fourier spectrun of image1');
I2 = gauss_lowpass(Itr); % filtering using gaussian lowpass filter
I3 = real(ifft2(I2));
for i=1:P
    for j=1:Q
        I3(i,j) = power(-1,(i+j))*I3(i,j);
        if ( I3(i,j)<0 )
            I3(i,j) = 0;
        end
    end
end
Iout = I3(1:M,1:N);% applying the inverse fourier transform
figure, imshow(Iout); title('After filtering');
% Jtr = fft(J);
% figure, imshow(Jtr); title('Fourier spectrun of image1');
% end
% Itr = fft(fft(I).').';
% fft(fft(double(Ipadded)).').'
% figure, imshow(real(Itr)); title('image spectrum');