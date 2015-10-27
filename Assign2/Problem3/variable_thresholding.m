function [ Img ] = variable_thresholding( I )
% variable_thresholding function does the thresholding based on local image
% properties.
[m,n] = size(I);
Img = zeros(m,n);
P1 = I(1:m/2,1:n/2);
P2 = I(1:m/2,n/2+1:end);
P3 = I(m/2+1:end,1:n/2);
P4 = I(m/2+1:end,n/2+1:end);
P1_1 = local_thresholding(P1);
P2_1 = local_thresholding(P2);
P3_1 = local_thresholding(P3);
P4_1 = local_thresholding(P4);
Img(1:m/2,1:n/2) = P1_1;
Img(1:m/2,n/2+1:end) = P2_1;
Img(m/2+1:end,1:n/2) = P3_1;
Img(m/2+1:end,n/2+1:end) = P4_1;
end

