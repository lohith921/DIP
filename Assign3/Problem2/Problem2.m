clear;
close all;
I = imread('moonlanding.png');
I = im2double(I);
%figure, imshow(I); title('original image');
[M,N] = size(I);
% padding parameters
P = 2*M;
Q = 2*N;
% padded image
Fp = zeros(P,Q);
% copying image to the top left quadrant
Fp(1:M,1:N) = I;
% multiplying with -1^(u+v) to center the transform.
% for i = 1:P
%     for j = 1:Q
%         Fp(i,j) = power(-1,(i+j))*Fp(i,j);
%     end
% end
% Fourier transform of the image.
 Ftr = real(fft2(Fp));
% Ftr = real(fft2(Fp));
% figure, imshow(Itr); title('spectrum');
% lets design the butterworth band reject filter
H = zeros(P,Q);
n = 0.2; % order of butterworth filter
D0 = 70;
W = 150; % width of the band
a = P/2;
b = Q/2;
for u = 1:P
    for v = 1:Q
        D = power((u-a),2) + power((v-b),2);
        D = sqrt(D);
        k = power(D,2) - power(D0,2);
        K = power((D*W/k), 2*n);
        H(u,v) = 1/(1+K);
    end
end
% lets construct band pass filter
Hp = zeros(P,Q);
% for i = 1:P
%     for j = 1:Q
%         Hp(i,j) = 1-H(i,j);
%     end
% end        
G = H.*Ftr;
Fp = real(ifft2(G));
% for i = 1:P
%     for j = 1:Q
%         Fp(i,j) = power(-1,(i+j))*Fp(i,j);
%     end
% end
Iout = Fp(1:M,1:N);
figure, imshow(Iout); title('Filtered with n=0.2,D0=70,W=150');
% end

