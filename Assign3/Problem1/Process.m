function [ Iout ] = Process( In )
% This does all the processing for the input image
Inoise = imnoise(In,'gaussian',0,0.2);
figure, imshow(Inoise); title('Image with Gaussian noise');
% Filtering in frequency domain begins here Lecture #22
[M, N] = size(Inoise);
% padding parameters
P = 2*M;
Q = 2*N;
% padded image
Fp = zeros(P,Q); 
Fp(1:M,1:N) = Inoise;
% shifting image to center
for u = 1:P
    for v = 1:Q
        b = power(-1, (u+v));
        Fp(u,v) = b*Fp(u,v);
    end
end
Itr = real(fft2(Fp));
figure, imshow(real(Itr)); title('Fourier spectrun of image');
% filtering using gaussian lowpass filter
I2 = gauss_lowpass(Itr); 
I3 = real(ifft2(I2));
for u = 1:P
    for v = 1:Q
        I3(u,v) = power(-1,(u+v))*I3(u,v);
    end
end
% applying the inverse fourier transform
Iout = I3(1:M,1:N);
figure, imshow(Iout); title('After filtering');
Ifinal = Inoise - Iout;
Imask = Ifinal - In;
Ifinal2 = Inoise - Imask;
figure, imshow(Ifinal2); title('Restored image with post processing');
end

