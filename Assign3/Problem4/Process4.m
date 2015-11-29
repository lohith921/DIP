function [ ] = Process4( In )
% Process4 does all the processing
In = rgb2gray(In);
In = im2double(In);
[M,N]=size(In);
figure, imshow(In); title('Original image');
Ft = fftshift(fft2(In));
% Atmospheric turbulence with k = 0.002
k = 0.002;
u0 = M/2;
v0 = N/2;
u = (1:M)-u0;
v = (1:N)-v0;
[U,V] = meshgrid(u,v);
D = (U.^2+V.^2);
H = exp(-k*(D.^(5/6)));
Ftr = Ft .* H;
Fblurred = real(ifft2(ifftshift(Ftr)));
figure, imshow(Fblurred); title('Image with atmospheric turbulence');
% lets add gaussian noise with mean = 0 and variance 0.02
Gn = imnoise(Fblurred,'gaussian',0,0.02);
figure, imshow(Gn); title('Image with gaussian noise');
% designing filter with width 70
Fblurrnoisy = fftshift(fft2(Gn));
Fblurr = gauss_lowpass(Fblurrnoisy);
figure, imshow(real(ifft2(ifftshift(Fblurr)))); title('Gaussian noise removed');
radius = 70;
a = floor(M/2)+1;
b = floor(N/2)+1;
for i = 1:M
    for j = 1:N
        dist = ((i-a)^2 + (j-b)^2)^0.5;
        if dist < radius
            Fblurr(i,j) = Fblurr(i,j)/H(i,j);
        else
            Fblurr(i,j) = 0;
        end
    end
end
% restoring
Frreal = abs(ifft2(ifftshift(Fblurr)));
figure, imshow(Frreal); title('restored with inverse filter');
% weiner filter
% W(i,j) = (1/H(i,j))*((abs(H(i,j))^2)/(abs(H(i,j))^2+1000));
L = conj(H)./(H .* (conj(H) + 1000));
% H1 = abs(H).^2;
% H2 = H1 + 1000;
% H3 = H1./H2;
% L = conj(H) * H3;
Fweiner = L .* Fblurr;
figure, imshow(abs(ifft2(ifftshift(Fweiner)))); title('Restored with Weiner filter');
end