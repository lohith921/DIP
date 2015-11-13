function [out] = bubo(In, alpha)
% program for contrast enhancement using bin underflow and bin overflow mechanism
% The corresponding paper is 'CONTRAST ENHANCEMENT USING HISTOGRAM EQUALIZATION
% WITH BIN UNDERFLOWAND BIN OVERFLOW'
In = imresize(In, 0.65);
figure, imshow(In); title('Reduced image');
[M,N]=size(In);
sz = M*N;
Cbu = (1 - alpha)/sz;
Cbo = (1 + alpha)/sz;
% K = 256;
K = max(max(In));
p = zeros(K,1); % probability density function
for i=1:K
    temp = find(In==(i-1));
    [nk,d] = size(temp);
    p(i) = nk/sz;
end
pn = zeros(K,1); % modified probability density function
for i = 1:K
    if p(i) > Cbo
        pn(i) = Cbo;
    elseif( p(i)<Cbu)
        pn(i)=Cbu;
    else
        pn(i)=p(i);
    end
end
% cumulative distribution function
C = zeros(K,1);
su = 0;
for i=1:K
    for j=1:i
        su = su+pn(j);
    end
    C(i) = su;
    su = 0;
end
Iout = In;
for i=1:M
    for j=1:N
        k = In(i,j);
        t= (C(K)/K)*k;
        t1 = K*(C(k+1)-t)+k;
        Iout(i,j) = t1;
    end
end
out = Iout;
end
% end of program.
 