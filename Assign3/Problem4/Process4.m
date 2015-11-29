function [ ] = Process4( In )
% Process4 does all the processing
[M,N,p]=size(In);
if p ~= 0
    In = rgb2gray(In);
end
P = 2*M;
Q = 2*N;
figure, imshow(In); title('Original image');
% Padding
Fp = zeros(P,Q);
% copying image to top left quadrant
Fp(1:M, 1:N) = In;
% shifting
for i = 1:P
    for j = 1:Q
        Fp(i,j) = (-1)^(i+j)*Fp(i,j);
    end
end
% fourier transform
Ftr = fft2(Fp);
% Atmospheric turbulence
H = zeros(P,Q);
k = 0.002;
% computing convolution matrix for atmospheric turbulence
a = P/2;
b = Q/2;
for u = 1:P
    for v = 1:Q
        l = ((u-a)^2 + (v-b)^2)^(5/6);
        l = -1*k*l;
        H(u,v) = exp(l);
    end
end
Ftr = H.*Ftr;
Fr = real(ifft2(Ftr));
 % shifting back
for i = 1:P
    for j = 1:Q
        Fr(i,j) = (-1)^(i+j)*Fr(i,j);
    end
end
figure, imshow(Fr(1:M,1:N)); title('Image with atmospheric turbulence');
% lets add gaussian noise with mean = 0 and variance 0.02
Gn = imnoise(Fr,'gaussian',0,0.02);
figure, imshow(Gn(1:M,1:N)); title('Image with gaussian noise');
% Inverse filtering begins now.
% remove gaussian noise using mean filter
% Fclear = conv2(single(Gn), ones(5)/25);
Fclear = imgaussfilt(Gn, 0.02);
% Fclear = gauss_lowpass(Gn);
figure, imshow(Fclear(1:M,1:N)); title('Gaussian noise removed');
% lets transform it to frequency domain
% shifting
for i = 1:P
    for j = 1:Q
        Fclear(i,j) = (-1)^(i+j)*Fclear(i,j);
    end
end
% fourier transform
Ftclear = real(fft2(Fclear));
Hr = H;
% Hr(degradation function) is going to be the inverse of H. 
% so when multiplied by Hr, the improper image should return original
% image.
% designing filter with width 70
for u = 1:P
    for v = 1:Q
        l = ((u-70)^2 + (v-70)^2)^(5/6);
        l = 1*k*l; % exponent is made positive.
        Hr(u,v) = exp(l);
    end
end
% convolving padded image
Fpr = Hr.*Ftclear;
Fpreal = real(ifft2(Fpr));
for i = 1:P
    for j = 1:Q
        Fpreal(i,j) = power(-1,(i+j))*Fpreal(i,j);
    end
end
Ffinal = Fpreal(1:M,1:N);
figure, imshow(Ffinal); title('Final output image');
end

