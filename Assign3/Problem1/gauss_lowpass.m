function [out] = gauss_lowpass(In)
% function to implement the gaussian low pass filter.
[P , Q] = size(In);
% D0 = sum(sum(In))/(P*Q);
D0 = 20;
% out = In;
H = zeros(P,Q);
a = P/2;
b = Q/2;
K = power(D0,2);
K = 2*K;
D = 0;
for i = 1:P
    for j = 1:Q
        D = power((i-a),2) + power((j-b),2);
        D = sqrt(D);
        k = power(D,2);
        H(i,j) = exp((-1*k)/ K);
        k = 0;
    end
end
out = H.*In;
end
