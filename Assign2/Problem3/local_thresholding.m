function [ I ] = local_thresholding( ip )
% local_thresholding computes a threshold for every pixel 
% based on the std and mean in the neighbourhood 
%ip = im2double(ip);
[a,b]=size(ip);
a 
b
% lets compute the mean
mmean = sum(ip(1:end,1:end));
 % mmean is a column vector with mean for each row of ip
mmean1 = sum(mmean);
p = a*b;
mmean1 = mmean1/(p);
mmean1
sqsum = zeros(1);
x = zeros(1);
for i = 1:a
    for j = 1:b
        x = mmean1-ip(i,j);
        sqsum = sqsum + x*x; 
    end
end
sqsum = sqsum/(a*b);
sqsum = sqrt(single(sqsum));
% sqsum = nthroot(sqsum,2);
% sqsum = sqsum^(1/2);
fprintf('variance is %f\n',sqsum);
T = a*sqsum + b*mmean1;
I = global_Thresholding_1(ip,T);        
end

