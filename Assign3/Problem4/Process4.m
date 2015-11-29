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
        Fp(i,j) = power(-1,(i+j))*Fp(i,j);
    end
end
% fourier transform
Ftr = fft2(Fp);
% Atmospheric turbulence with k = 0.002
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
% shifting
for i = 1:P
    for j = 1:Q
        Fr(i,j) = power(-1,(i+j))*Fr(i,j);
    end
end
figure, imshow(Fr(1:M,1:N)); title('Image with atmospheric turbulence');
% lets add gaussian noise with mean = 0 and variance 0.02
Gn = imnoise(Fr,'gaussian',0,0.02);
figure, imshow(Gn(1:M,1:N)); title('Image with gaussian noise');
% Inverse filtering begins now.
% remove gaussian noise using mean filter
% Fclear = conv2(single(Gn), ones(5)/25);
% Fclear = imgaussfilt(Gn, 0.02);
% Fclear = medfilt2(Gn,[9 9]);
% % Fclear = gauss_lowpass(Gn);
% figure, imshow(Fclear(1:M,1:N)); title('Gaussian noise removed');
% lets transform it to frequency domain
% fourier transform
% Hr = H;
% Hr(degradation function) is going to be the inverse of H. 
% so when multiplied by Hr, the improper image should return original
% image.
% designing filter with width 70
Ftclear = real(fftshift(fft2(Fr)));
radius = 70;
for i = 1:P
    for j = 1:Q
        dist = ((i-a)^2 + (j-b)^2)^0.5;
        if dist < radius
            Ftclear(i,j) = Ftclear(i,j)/H(i,j);
        else
            Ftclear(i,j) = 0;
        end
    end
end
Fpreal = real(ifftshift(ifft2(Ftclear)));
figure, imshow(Fpreal(1:M,1:N)); title('restored with inverse filter');
% weiner filter
% W(i,j) = (1/H(i,j))*((abs(H(i,j))^2)/(abs(H(i,j))^2+1000));
L=conj(H)./(H.*conj(H)+1000);
Fpweiner= Fpreal.*L;
figure, imshow(abs(ifft2(ifftshift(Fpweiner(1:M,1:N))))); title('Restored with Weiner filter');
% Ffinal = Fpweiner(1:M,1:N);
% figure, imshow(Ffinal); title('Final output image');
end

