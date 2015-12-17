function [out]= bbhe(In)
% program for brightness preserving bi-histogram equalization
% corresponding paper is:" Minimum mean brightness error bi-histogram
% equalization in contrast enhancement"
[m,n] = size(In);
X0 = min(min(In));
Xm = max(max(In));
L = 256;
%me = round(mean2(In));
me = round(mean2(In));
Ilow = find(In < me);
[nlow, ~] = size(Ilow);
Ihigh = find(In >= me);
[nhigh, ~] = size(Ihigh);
% Ihigh = find(In>me);
% probabilities
plow = zeros(me,1);
phigh = zeros(L-me,1);
% compute probability density functions for both sub images
for i = 1:me-1
    temp = find(In==(i-1));
    [nk,~] = size(temp);
    plow(i) = nk/nlow;
    temp = 0;
end
for j = me:256
    temp = find(In==(j-1));
    [nk,~] = size(temp);
    phigh(j-me+1) = nk/nhigh;
    temp = 0;
end
% lets compute corresponding cumulative distribution function
Clow = zeros(me,1);
Chigh = zeros(L-me,1);
su = 0;
for i = 1:me-1
    for j = 1:i
        su = su+plow(j);
    end
    Clow(i) = su;
    su = 0;
end
j = 1;
for i = me:L
    for k = me+1:i
        su = su+phigh(j);
    end
    Chigh(j) = su;
    j = j+1;
    su = 0;
end
% output intensity mapping function
Iout = In;
for i = 1:m
    for j = 1:n
        p = In(i,j);
        if(p < me)
            Iout(i,j) = X0 + (me-X0)*Clow(p+1);
        else
            Iout(i,j) = me+1 + (Xm-me)*Chigh(me-p+1);
        end
    end
end
out = Iout;
end



