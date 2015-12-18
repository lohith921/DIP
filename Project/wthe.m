% Weighted thresholded intensity transformation program
% Paper: Fast Image/Video Contrast Enhancement Based on Weighted
% Thresholded Histogram Equalization
function [ out ] = wthe(In, r)
v = 0.5;
[m,n] = size(In);
sz = m*n;
% K = max(max(In));
K = 256;
pwt = zeros(K,1);
p = zeros(K,1);
for i = 1:K
    temp = find(In==(i-1));
    [nk, ~] = size(temp);
    p(i) = double(nk/sz);
end

Pu = v*max(p);
Pl = min(p);
for i = 1:K
    if(p(i) > Pu)
        pwt(i) = Pu;
    elseif(p(i) <= Pl)
        pwt(i) = 0;
    else
        t = double((p(i)-Pl)/(Pu-Pl));
        t1 = double((t^r)*Pu);
        pwt(i) = double(t1);
    end
end
% cumulative distribution function
Cwt = zeros(K,1);
su = 0.0;
for i = 1:K
    for j = 1:i
        su = su + pwt(j);
    end
    Cwt(i) = su;
    su = 0.0;
end
Inew = In;
% temporary parameter values
Wout = K-1;
Madj = 10;
for i=1:m
    for j=1:n
        p1 = In(i,j);
        if( p1 == 0 )
            p1 = 1;
        end
        Inew(i,j) = Wout*Cwt(p1)+Madj;
    end
end
out = Inew;
end
% end of program
% % weighted probability function
% p1 = sort(p);
% % selecting probabilities from top 10 and bottow 10 for Pu and Pl
% up = p1(K-alpha,:);
% low = p1(alpha,:);

