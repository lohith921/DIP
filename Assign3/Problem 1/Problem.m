% Script for Problem 1
I = imread('flower1.jpg');
I = rgb2gray(I);
J = imread('flower2.jpg');
J = rgb2gray(J);
figure, imshow(I); title('Original image1');
% figure, imshow(J); title('Original image2');
Inoise = imnoise(I,'gauss',0,0.2);
%figure, imshow(Inoise); title('Image1 with Gaussian noise');
% Jnoise = imnoise(J,'gauss',0,0.2);
% figure, imshow(Jnoise); title('Image2 with Gaussian noise');
% Filtering in frequency domain begins here Lecture #22
[M,N] = size(I);
if M > N
    P = M;
else
    P = N;
end
% We chose P to be max of the dimension M/N of the input image.
Ipadded = zeros(P,P);
% P = 2*M;
% Q = 2*N;
% Ipadded = zeros(P,Q);
Ipadded(1:M,1:N) = I;
for i=1:P
    for j=1:P
        Ipadded(i,j) = (-1)^(i+j)*Ipadded(i,j);
    end
end
Itr = fft2(Ipadded);
figure, imshow(Itr); title('Fourier spectrun of image1');
I2 = gauss_lowpass(Itr); % filtering using gaussian lowpass filter
I3 = real(ifft2(I2)); 
for i=1:P
    for j=1:P
        I3(i,j) = (-1)^(i+j)*I3(i,j);
%         if(I3(i,j)<0)
%             I3(i,j) = 0;
%         end
    end
end
Iout = I3(1:M,1:N);% applying the inverse fourier transform
figure, imshow(Iout); title('After filtering');
% Jtr = fft(J);
% figure, imshow(Jtr); title('Fourier spectrun of image1');
% end
