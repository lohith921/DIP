function [out] = gauss_lowpass(In)
% function to implement the gaussian low pass filter.
[P , Q] = size(In);
D0 = sum(sum(In))/(P*Q);
D0
% out = In;
H = zeros(P,Q);
for i = 1:P
    for j = 1:Q
        D = (i-P/2)^2 + (j-Q/2)^2;
        D = sqrt(D);
        H(i,j) = exp((-1)*(D^2) / 2*(D0^2));
    end
end
out = H.*In;
end
