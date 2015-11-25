function [out] = gauss_lowpass(In, D0)
% function to implement the gaussian low pass filter.
[P , Q] = size(In);
out = In;
for i = 1:P
    for j = 1:Q
        D = (i-P/2)^2 + (j-Q/2)^2;
        D = sqrt(D);
        out(i,j) = exp((-D)^2 / 2*(D0^2));
    end
end
end
