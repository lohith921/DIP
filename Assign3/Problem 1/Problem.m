% Script for Problem 1
I = imread('flower1.jpg');
I = rgb2gray(I);
J = imread('flower2.jpg');
J = rgb2gray(J);
figure, imshow(I); title('Original image1');
% figure, imshow(J); title('Original image2');
Inoise = imnoise(I,'gauss',0,0.2);
figure, imshow(Inoise); title('Image1 with Gaussian noise');
% Jnoise = imnoise(J,'gauss',0,0.2);
% figure, imshow(Jnoise); title('Image2 with Gaussian noise');
% Filtering in frequency domain begins here Lecture #22
[M,N] = size(I);
P = 2*M;
Q = 2*N;
Ipadded = zeros(P,Q);
Ipadded(1:M,1:N) = I;
for i=1:P
    for j=1:Q
        Ipadded(i,j) = (-1)^(i+j)*Ipadded(i,j);
    end
end
Itr = fft2(Ipadded);
figure, imshow(Itr); title('Fourier spectrun of image1');
I2 = gauss_lowpass(Itr,100); % filtering using gaussian lowpass filter
I3 = ifft2(I2); 
Iout = I3(1:M,1:N);% applying the inverse fourier transform
figure, imshow(Iout); title('After filtering');
% Jtr = fft(J);
% figure, imshow(Jtr); title('Fourier spectrun of image1');
% end
