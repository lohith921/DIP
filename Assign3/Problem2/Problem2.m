clear;
close all;
I = imread('i7w0S.1.png');
I = rgb2gray(I);
figure, imshow(I); title('Original image');
I = im2double(I);
[M, N] = size(I);
% padding parameters
P = 2*M;
Q = 2*N;
% padded image
Fp = padarray(I,[M N],0,'post');
% copying image to the top left quadrant
% Fp(1:M,1:N) = I;
% % multiplying with -1^(u+v) to center the transform.
for u = 1:P
    for v = 1:Q
        Fp(u,v) = power(-1,(u+v))*Fp(u,v);
    end
end
% figure, imshow(Fp); title('centered image');
% Fourier transform of the image.
Ftr = fft2(Fp);
Ftr = fftshift(Ftr);
Ftr1 = log(1+abs(Ftr));
Ftr1 = mat2gray(Ftr1);
% Fm = max(max(Ftr1));
% Ftr2 = Ftr1 ./ Fm;
figure, imshow(Ftr1,[]); title('Spectrum');
% lets design the butterworth band reject filter
H = zeros(P,Q);
n = 10; % order of butterworth filter
D0 = 0.00001;
W = 1; % width of the band
% a = P/2;
% b = Q/2;
for u = 1:P
    for v = 1:Q
        D = power((u-M),2) + power((v-N),2);
        D = sqrt(D);
        H1 = 1 / ((1+((D*W)/(D^2-D0^2)))^(2*n));
%         k = power(D,2) - power(D0,2);
%         K = power((D*W)/k, 2*n);
%         H1 = 1/(1+K);
        H(u,v) = H1;
    end
end
G = Ftr .* H;
Fp = abs(ifft2(ifftshift(G)));
%figure, imshow(Fp)); title('immediately afte ifft2');
for u = 1:P
    for v = 1:Q
        Fp(u,v) = power(-1,(u+v))*Fp(u,v);
    end
end
Iout = Fp(1:M,1:N);
figure, imshow(Iout); title('final output convl with spectrum');
% end


