function [ Iout ] = dsihe( In,mn )
% This program does the enhancement via the dualistic subimage histogram
% equalization algorithm
% corresponding paper is "Image enhancement based on equal area dualistic sub-image histogram equalization
% Input is a gray scale image.
[m,n] = size(In);
m0 = min(min(In));
mx = max(max(In));
L = 255;
Ilow = find(In <= mn);
Ihigh = find(In > mn);
[nlow, ~] = size(Ilow);
[nhigh, ~] = size(Ihigh);
plow = zeros(mn,1);
phigh = zeros(L-mn,1);
for i = 0:mn-1
    temp = find(In == i);
    [sz,~] = size(temp);
    plow(i+1) = double(sz/nlow);
    temp = 0;
end
for j = mn:255
   temp = find(In == j);
   [sz,~] = size(temp);
   if(j-mn == 0)
       ind = 1;
   else
       ind = j-mn;
   end
   phigh(ind) = double(sz/nhigh);
   temp = 0;
end
P = sum(double(plow));
Clow = zeros(mn,1);
Chigh = zeros(L-mn,1);
p = 0.0;
for i = 1:mn
    for j = 1:i
        p = p + plow(j);
    end
    Clow(i) = p/P;
    p = 0.0;
end
for i = mn+1:255
    for j = 1:i-mn
        p = p + phigh(j);
    end
    Chigh(i-mn) = abs(p/(1-P));
    p = 0.0;
end

for i = 1:m
    for j = 1:n
        if(In(i,j) < mn)
            In(i,j) = m0 + (mn-m0)*Clow(In(i,j)+1);
        elseif(In(i,j) >= mn)
            if(In(i,j)-mn == 0)
                ind = 1;
            else
                ind = In(i,j)-mn;
            end
                In(i,j) = mn + (mx-mn)*Chigh(ind);
        end
    end
end
%figure, imshow(In);
Iout = In;
end
% L = 256;
% me = round(mean2(In));
% Ilow = In;
% Ihigh = In;
% for i= 1:m
%     for j = 1:n
%         if (In(i,j) <= me)
%             Ihigh(i,j) = 0;
%         else 
%             Ilow(i,j) = 0;
%         end
%     end
% end
% Ilow1 = histeq(Ilow,me);
% Ihigh1 = histeq(Ihigh,255);
% I = Ilow1 + Ihigh1;
% figure, imshow(I);
% Iout = I;


