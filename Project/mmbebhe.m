function [out]= mmbebhe(In)
% program for minimum mean brightness preserving bi-histogram equalization
% corresponding paper is: 'Minimum Mean Brightness Error Bi-Histogram Equalization in
% Contrast Enhancement '
[m,n]=size(In);
% N total # of pixels
N = m*n;
% intensity level
L = max(max(In));
% K=256;
% scaled mean brightness error
SMBE = zeros(L,1);
su = 0;
sz = 0.0;
% the following block of code computes sigma i*F(i)
for i=1:L
    temp = find(In == (i-1));
    [sz] = (size(temp));
    su = su + (i-1)*int16(sz);
end
% SMBE0
t = find(In == 0);
SMBE(1) = L*(N - size(t)) - 2*su;
% SMBEi for i = 1 to K-1
for i=2:L
    t = find(In == (i-1));
    SMBE(i) = SMBE(i-1) + N - L*size(t);
end
% selected min mean
me = min(SMBE);
% dividing into sub images
Ilow = (I<=me);
[Mlow, Nlow] = size(Ilow);
Ihigh = (I>me);
[Mhigh, Nhigh] = size(Ihigh);
plow = zeros(me,1);
phigh = zeros(L-me+1,1);
% compute probability density functions for both sub images
for i=1:me
    temp = find(Ilow==(i-1));
    nk = size(temp);
    plow(i) = nk/Mlow*Nlow;
end
for i=me+1:L
    temp = find(Ihigh==(i-1));
    nk = size(temp);
    phigh(i) = nk/Mhigh*Nhigh;
end
% lets compute corresponding cumulative distribution function
Clow = zeros(me,1);
Chigh = zeros(L+1-me,1);
su = 0;
for i=1:me
    for j=1:i
        su = su+plow(j);
    end
    Clow(i)=su;
    su = 0;
end
for i=me+1:L
    for j=1:i
        su = su+phigh(j);
    end
    Chigh(i)=su;
    su = 0;
end
% we have CDF, we will compute the output intensities
Iout = In;
for i=1:m
    for j=1:n
        if(In(i,j)<=me)
            Iout(i,j) = 0 + (me-In(i,j))*Clow(i);
        else
            Iout(i,j) = me+1 + (L-In(i,j))*Chigh(i);
        end
    end
end
out = Iout;
end
% end of program
