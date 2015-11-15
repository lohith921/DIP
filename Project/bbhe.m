function [out]= bbhe(In)
% program for brightness preserving bi-histogram equalization
% corresponding paper is:
[m,n]=size(In);
K = max(max(In));
% K=256;
me = mean2(In);
me = round(me);
% dividing into sub images
Ilow = (In<=me);
[mlow, nlow] = size(Ilow);
Nlow = mlow*nlow;
Ihigh = (In>me);
[mhigh, nhigh] = size(Ihigh);
Nhigh = mhigh*nhigh;
% probabilities
plow = zeros(me,1);
phigh = zeros(K-me+1,1);
% compute probability density functions for both sub images
for i=1:me
    temp = find(Ilow==(i-1));
    [nk,~] = size(temp);
    plow(i) = nk/Nlow;
end
for i=me+1:K
    temp = find(Ihigh==(i-1));
    [nk,~] = size(temp);
    phigh(i) = nk/Nhigh;
end
% lets compute corresponding cumulative distribution function
Clow = zeros(me,1);
Chigh = zeros(K-1-me,1);
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
% output intensity mapping function
Iout = In;
for i=1:m
    for j=1:n
        if(In(i,j)<me)
            Iout(i,j) = (me-In(i,j))*Clow(In(i,j)+1);
        else
            Iout(i,j) = me+1 + (K-In(i,j))*Chigh(In(i,j)+1);
        end
    end
end
out = Iout;
end
% end of program


