clear;
close all;
I = imread('i7w0S.1.png');
I = im2double(I);
I = rgb2gray(I);
figure, imshow(I); title('Original image');
D0 = 50;
D1 = 200;
% order
n = 4;
[M, N] = size(I);
Ftr = fft2(I,2*M-1,2*N-1);
Fp = fftshift(Ftr);
Fp1 = log(1+abs(Fp));
Fm = max(max(Fp1));
figure, imshow(Fp1 ./ Fm); title('Spectrum');

% Initializing filters.
filter1 = ones(2*M-1,2*N-1);
filter2 = ones(2*M-1,2*N-1);
filter3 = ones(2*M-1,2*N-1);

for i = 1:2*M-1
    for j =1:2*N-1
        Duv = ((i-(M+1))^2 + (j-(N+1))^2)^.5;
        % Create Butterworth filter.
        filter1(i,j)= 1/(1 + (Duv/D1)^(2*n));
        filter2(i,j) = 1/(1 + (Duv/D0)^(2*n));
        filter3(i,j)= 1.0 - filter2(i,j);
        filter3(i,j) = filter1(i,j).*filter3(i,j);
    end
end
% Update image with passed frequencies.
% filtered_image = Fp + filter3.*Fp;
filtered_image = filter3 .* Fp;
% filter31 = log(1+abs(filter3));
% Flm = max(filter31(:));
% figure, imshow(filter31/Flm); title('Filter Image');
%fftshow(filter3,'log')
filtered_image = ifftshift(filtered_image);
filtered_image = ifft2(filtered_image,2*M-1,2*N-1);
filtered_image = real(filtered_image(1:M,1:N));
figure, imshow(filtered_image); title('Filtered Image');
%end



