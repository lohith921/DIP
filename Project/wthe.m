function [ out ] = wthe(In, r)
% Weighted thresholded intensity transformation program
% Paper: Fast Image/Video Contrast Enhancement Based on Weighted
% Thresholded Histogram Equalization
v = 0.5;
[m,n] = size(In);
sz = m*n;
% K = max(max(In));
K = 256;
pwt = zeros(K,1);
p = zeros(K,1);
for i = 1:K
    temp = find(In==(i-1));
    [nk, d] = size(temp);
    p(i) = nk/sz;
end
% % weighted probability function
% p1 = sort(p);
% % selecting probabilities from top 10 and bottow 10 for Pu and Pl
% up = p1(K-alpha,:);
% low = p1(alpha,:);
Pu = v*max(p);
Pl = min(p);
for i = 1:K
    if(p(i) > Pu)
        pwt(i) = Pu;
    elseif(p(i) <= Pl)
        pwt(i) = 0;
    else
        t = (p(i)-Pl)/(Pu-Pl);
        t1 = (t^r)*Pu;
        pwt(i) = t1;
    end
end
% cumulative distribution function
Cwt = size(K,1);
su = 0;
for i = 1:K
    for j = 1:i
        su = su + pwt(j);
    end
    Cwt(i) = su;
end
Inew = In;
% temporary parameter values
Wout = K-1;
Madj = 0;
for i=1:m
    for j=1:n
        Inew(i,j) = Wout*Cwt(In(i,j)+1)+Madj;
    end
end
out = Inew;
end
% end of program

