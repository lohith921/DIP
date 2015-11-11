function [ Op ] = global_Thresholding_1( I,T )
% This function does the basic global thresholding 
% this is called from local_thresholding
[m,n]=size(I);
I1 = zeros(m,n);
fprintf('The threshold value choosen is %d\n',T);
for i=1:m
    for j=1:n
        if(I(i,j)<=T)
            I1(i,j)=0;
        else
            I1(i,j)=1;
        end
    end
end
Op=I1;
end

