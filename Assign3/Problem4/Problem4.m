clear;
close all;
I = imread('flower1.1.jpg');
I = im2double(I);
% J = imread('flower2,jpg');
[M,N,p]=size(I);
if p ~= 0
    I = rgb2gray(I);
end
% if M>N
%     P = M;
% else
%     P = N;
% end
P = 2*M;
Q = 2*N;
figure, imshow(I); title('original image');
% I = imnoise(I,'gaussian',0,0.5);
% figure, imshow(I); title('with gaussian noise');
H = zeros(P,Q);
k = 0.002;
% computing convolution matrix for atmospheric turbulence
for u = 1:P
    for v = 1:Q
        l = (u^2 + v^2)^(5/6);
        l = -1*k*l;
        H(u,v) = exp(l);
    end
end
F = zeros(P,Q);
F(1:M, 1:N) = I;
% F = real(fft2(F));
F = fft2(F);
% adding atmospheric turbulence
G = F.*H;
figure, imshow(real(ifft2(G))); title('image with atmospheric turbulence');
for i = 1:P
    for j = 1:Q
        G(i,j) = (-1)^(i+j)*G(i,j);
    end
end

% lets add gaussian noise with mean = 0 and variance 5.
Gn = imnoise(G,'gaussian',0,0.5);
figure, imshow(real(Gn)); title('image with gaussian noise');
% lets apply inverse filtering. 
% designing filter with width 70
for u = 1:P
    for v = 1:P
        l = (u^2 + v^2)^(5/6);
        l = -1*k*l;
        H(u,v) = exp(l);
    end
end
% Noise
N1 = Gn - G;
G = G./H;
figure, imshow(real(G));title('figure with divided H');
%N = Gn./H;
N1 = N1./H;
F = G - N1;
Iout = real(ifft2(F));
% for i = 1:P
%     for j = 1:P
%         Iout(i,j) = (-1)^(i+j)*Iout(i,j);
%     end
% end
figure, imshow(Iout(1:M,1:N)); title('image restored using inverse filtering');
% end




