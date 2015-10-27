function [ Op ] = global_Thresholding_1( I,T )
%UNTITLED4 Summary of this function goes here
[m,n]=size(I);
I1 = zeros(m,n);
fprintf('The threshold value choosen is %d\n',T);
for i=1:m;
    for j=1:n;
        if(I(i,j)<=T)
            I1(i,j)=0;
        else
            I1(i,j)=1;
        end
    end
end
Op=I1;
end

