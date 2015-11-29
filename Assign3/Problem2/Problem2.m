clear;
close all;
I = imread('i7w0S.png');
I = im2double(I);
figure, imshow(I); title('original image');
[M, N] = size(I);
% padding parameters
P = 2*M;
Q = 2*N;
% padded image
Fp = zeros(P,Q);
% copying image to the top left quadrant
Fp(1:M,1:N) = I;
% % multiplying with -1^(u+v) to center the transform.
% for u = 1:P
%     for v = 1:Q
%         Fp(u,v) = power(-1,(u+v))*Fp(u,v);
%     end
% end
% Fourier transform of the image.
Ftr = fft2(Fp);
Ftr = fftshift(Ftr);
Ftr1 = log(1+abs(Ftr));
figure, imshow(Ftr1);

% processing the spectrum
Imin = min(min(Ftr));
Imax = max(max(Ftr));
for u = 1:M
    for v = 1:N
        if(Ftr(u,v) == Imin)
            Ftr(u,v) = 0;
        elseif(Ftr(u,v) == Imax)
            Ftr(u,v) = 255;
        end
    end
end
figure, imshow(Ftr); title('spectrum');
% lets design the butterworth band reject filter
H = zeros(P,Q);
n = 6; % order of butterworth filter
D0 = 200;
W = 250; % width of the band
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
for u = 1:P
    for v = 1:Q
        Hp(u,v) = 1-H(u,v);
    end
end        
G = Hp.*Fp;
Fp = real(ifft2(G));
for u = 1:P
    for v = 1:Q
        Fp(u,v) = power(-1,(u+v))*Fp(u,v);
    end
end
Iout = Fp(1:M,1:N);
Ifinal = I - Iout;
Imask = Ifinal - I;
Ifinal2 = I - Imask;
figure, imshow(Ifinal2);
% figure, imshow(Iout); title('band pass with n=6,D0=200,W=250');
% figure, imshow(Ifinal); title('Ifinal');
% figure, imshow(Imask); title('Imask');
% end


