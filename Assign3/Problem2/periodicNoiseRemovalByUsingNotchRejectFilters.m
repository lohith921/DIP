clear all
close all
%this script shows how to remove periodic noise from an image by making use
%of notch reject filters
%by Lin Zhang, SSE, Tongji University, Shanghai, Mar. 2013

%load an image with periodic noise
im = double(imread('i7w0S.png'));


%In order to perform filtering in the frequency domain, we need to pad the
%image at first
[rows, cols] = size(im);
paddedIm = padarray(im, [rows, cols],'post');
%figure;
%imshow(paddedIm,[]);
%title('padded noisy image');

%Compute the Fourier transform of the image
fftImg = fft2(paddedIm);
fftImgShifted = fftshift(fftImg);

%construct butterworth notch reject filters
centers = [55 135; -180 70];
D0 = 110;
order = 10;
Huv = ButterworthNotchFilter(2*rows, 2*cols, centers, D0, order);

filterImg = real(ifft2(ifftshift(fftImgShifted .* Huv)));
finalResult = filterImg(1:rows, 1:cols);
subplot(2,2,1),imshow(im,[]),title('noisy image');
%show the Fourier spectrum in log scale
subplot(2,2,2),imshow(log(1+abs(fftImgShifted)),[]) ,title('Fourier spectrum of the noisy image (shown in log scale)');
subplot(2,2,3),imshow(Huv,[]),title('the Fourier spectrum of the notch reject filter constructed');
subplot(2,2,4),imshow(finalResult,[]),title('final result');
