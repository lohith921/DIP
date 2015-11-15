function [out]= mmbebhe(In)
% program for minimum mean brightness preserving bi-histogram equalization
% corresponding paper is: 'Minimum Mean Brightness Error Bi-Histogram Equalization in
% Contrast Enhancement '
[m,n]=size(In);

K = max(max(In));
% K=256;
SMBE[K];
for i=1:K
  temp = find(In == (i-1));
  su = su + (i-1)*size(temp);
 end
t = find(In == 0);
SMBE(1) = K*(M*N - size(t)) - 2*su;
for i=2:K
 t = find(In == (i-1));
 SMBE(i) = SMBE(i-1) + M*N - K*size(t);
% dividing into sub images
Ilow = (I<=me);
[Mlow, Nlow] = size(Ilow);
Ihigh = (I>me);
[Mhigh, Nhigh] = size(Ihigh);
plow = zeros(me,1);
phigh = zeros(K-me+1,1);
% compute probability density functions for both sub images
for i=1:me
    temp = find(Ilow==(i-1));
    nk = size(temp);
    plow(i) = nk/Mlow*Nlow;
end
for i=me+1:K
    temp = find(Ihigh==(i-1));
    nk = size(temp);
    phigh(i) = nk/Mhigh*Nhigh;
end
% lets compute corresponding cumulative distribution function
Clow = zeros(me,1);
Chigh = zeros(K+1-me,1);
su = 0;
for i=1:me
    for j=1:i
        su = su+plow(j);
    end
    Clow(i)=su;
    su = 0;
end
for i=me+1:K
    for j=1:i
        su = su+phigh(j);
    end
    Chigh(i)=su;
    su = 0;
end
  