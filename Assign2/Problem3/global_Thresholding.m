function [ Op ] = global_Thresholding( I )
% global_thresholding function
%   Detailed explanation goes here
[m,n]=size(I);
I1 = zeros(m,n);
T = sum(sum(I))/(m*n);
flag = true;
while flag
for i=1:m;
m1 = 0;
m2 = 0;
c1 = 0;
c2 = 0;
    for j=1:n;
        if(I(i,j)<=T)
            I1(i,j)=0;
            m1=m1+I(i,j);
            c1=c1+1;
        else
            I1(i,j)=1;
            m2=m2+I(i,j);
            c2=c2+1;
        end
    end
end
%m1
%m2
%figure, imshow(I1); title('Segmented image using global thresholding');
% computing mean of groups
m1=m1/c1;
m2=m2/c2;
if(abs(m1-m2)==0)
    flag = false;
else
    T = (m1+m2)/2;
end
end
Op=I1;
end

