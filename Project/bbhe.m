function [out]= bbhe(In)
% program for brightness preserving bi-histogram equalization
% corresponding paper is:" Minimum mean brightness error bi-histogram
% equalization in contrast enhancement"
[m,n] = size(In);
% K = int16(max(max(In)));
L = 256;
% K=256;
me = round(mean2(In));

Ilow = find(In <= me);
Ihigh = find(In > me);

[mlow, nlow] = size(Ilow);
Nlow = mlow*nlow;
% Ihigh = find(In>me);
[mhigh, nhigh] = size(Ihigh);
Nhigh = mhigh*nhigh;
% probabilities
plow = zeros(me,1);
t = L-me;
phigh = zeros(t,1);
% compute probability density functions for both sub images
for i = 1:me+1
    temp = find(In==(i-1));
    [nk,~] = size(temp);
    plow(i) = nk/Nlow;
end
j=1;
for i = me+2:L
    temp = find(In==(i-1));
    [nk,~] = size(temp);
    phigh(j) = nk/Nhigh;
    j = j+1;
end
% lets compute corresponding cumulative distribution function
Clow = zeros(me,1);
Chigh = zeros(t,1);
su = 0;
for i = 1:me
    for j = 1:i
        su = su+plow(j);
    end
    Clow(i) = su;
    su = 0;
end
j = 1;
for i = me+1:L
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
            Iout(i,j) = (me-p)*Clow(p+1);
        else
            Iout(i,j) = me + (L-1-p)*Chigh(255-p+1);
        end
    end
end
out = Iout;
end
% end of program
% for i=1:m
%     for j=1:n
%         if(In(i,j) <= me)
%             Ilow(Ii) = In(i,j);
%             Ii = Ii + 1;
%         else
%             Ihigh(Ih) = In(i,j);
%             Ih = Ih + 1;
%         end
%     end
% end
% Ilow = find(In<=me);
% me = round(me);
% dividing into sub images
% Ilow = zeros(100, 1);
% Ihigh = zeros(100, 1);
% Ii = 1;
% Ih = 1;


