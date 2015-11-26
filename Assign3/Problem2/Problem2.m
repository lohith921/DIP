I = imread('moonlanding.png');
I = im2double(I);
[M,N] = size(I);
% padding parameters
P = 2*M;
Q = 2*N;
figure, imshow(I); title('original image');
Fp = zeros(P,Q);
Fp(1:M,1:N) = I;
% for i = 1:P
%     for j = 1:Q
%         Fp(i,j) = power(-1,(i+j))*Fp(i,j);
%     end
% end
Itr = real(fft2(Fp));
figure, imshow(Itr); title('spectrum');

