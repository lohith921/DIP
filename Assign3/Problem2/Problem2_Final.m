clear;
close all;
I = imread('i7w0S.1.png');
I = rgb2gray(I);
figure, imshow(I); title('original image');
I = im2double(I);
[M, N] = size(I);
% padding parameters
P = 2*M;
Q = 2*N;
Fpadded = zeros(P,Q);
Fpadded(1:M, 1:N) = I;
% centering the transform.
for u = 1:P
    for v = 1:Q
        Fpadded(u,v) = power(-1,(u+v))*Fpadded(u,v);
    end
end
% fourier transform
F = fft2(Fpadded);
F = fftshift(F);
F1 = log(1+abs(F));
Fm = max(max(F1));
figure, imshow(F1 ./ Fm); title('Spectrum');
n=10;
D0 =0.00001;
W = 1;
Hp = zeros(P,Q);
a = P/2;
b = Q/2;
for u = 1:P
    for v = 1:Q
    D = sqrt((u-a)^2 + (v-b)^2);
    H = 1 / ((1+((D*W)/(D^2-D0^2)))^(2*n));
    Hp(u,v) = H ;
    end
end
G = Hp .* F;
G = ifftshift(G);
J = real(ifft2(G));
% figure, imshow(J); title('before multiplying');
for i = 1:P
    for j = 1:Q
        J(i,j) = power(-1,(i+j))*J(i,j);
    end
end
figure, imshow(J(1:M,1:N)); title('filtered output');