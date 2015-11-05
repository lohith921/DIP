function [ I ] = local_thresholding( ip )
% local_thresholding computes a threshold for every pixel 
% based on the std and mean in the neighbourhood 
%ip = im2double(ip);
[a,b]=size(ip);
%fprintf('The sizes are %d, %d\n',a,b);
% lets compute the mean
mmean = sum(ip(1:end,1:end));
 % mmean is a column vector with sum for each row of ip
mmean1 = sum(mmean);
fprintf('mean sum is %f\n',mmean1);
p = a*b;
mmean1 = mmean1/(p);
mmean1
sqsum = zeros(1);
%sqsum
%sqsum = 0;
x = zeros(1);
%x
%x = 0;
for i = 1:a
    for j = 1:b
        k=ip(i,j);
        x = double(abs(mmean1-k));
        sqsum = sqsum + x*x;
    end
end
fprintf('sqsum is %f\n',sqsum);
sqsum = sqsum/(a*b-1);

sqsum = sqrt(double(sqsum));
% sqsum = nthroot(sqsum,2);
% sqsum = sqsum^(1/2);
fprintf('variance is %f\n',sqsum);
T = a*sqsum + b*mmean1;
T
I = global_Thresholding_1(ip,T);        
end

