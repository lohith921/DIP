function [ I ] = local_thresholding( ip )
% local_thresholding computes a threshold for every pixel 
% based on the std deviation and mean in the neighbourhood 
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
% % variable_thresholding function does the thresholding based on local image
% % properties.
% [m,n] = size(I);
% m1 = m;
% n1 = n;
% if(mod(m,2) ~= 0)
%     m1 = m1+1;
% end
% if(mod(n,2) ~= 0)
%     n1 = n1+1;
% end
% I1 = zeros(m1,n1);
% I1(1:m,1:n) = I;
% Isome = I;
% %figure, imshow(Isome);
% [M,N]=size(I1);
% fprintf('Size of I1 is %d, %d\n',M,N);
% P1 = I(1:m1/2-1,1:n1/2-1);
% P2 = I(1:m1/2-1,n1/2:end);
% P3 = I(m1/2:end,1:n1/2-1);
% P4 = I(m1/2:end,n1/2:end);
% % Otsu's method of segmentation
% level = graythresh(P1);
% P1_1 = im2bw(P1,level);
% %
% level = graythresh(P2);
% P2_1 = im2bw(P2,level);
% %
% level = graythresh(P3);
% P3_1 = im2bw(P3, level);
% %
% level = graythresh(P4);
% P4_1 = im2bw(P4,level);
% % sub images are thresholded
% % figure, imshow(P1_1); title('Part 1');
% % figure, imshow(P2_1); title('Part 2');
% % figure, imshow(P3_1); title('Part 3');
% % figure, imshow(P4_1); title('Part 4');
% % [k1,k2]=size(P1);
% % [k3,k4]=size(P2);
% % [k5,k6]=size(P3);
% % [k7,k8]=size(P4);
% % fprintf('The sizes are k1=%d k2=%d k3=%d k4=%d\n',k1,k2,k3,k4);
% % fprintf('the sizes are k5=%d k6=%d k7=%d k8=%d\n',k5,k6,k7,k8);
% %  Img = zeros(m1,n1);
% figure, imshow(P1_1);
% k=1;
% l=1;
% for i=1:(m1/2)-1
%     for j=1:(n1/2)-1
%         Isome(i,j) = P1_1(k,l);
%         l = l+1;
%     end
%     k = k+1;
%     l = 1;
% end
% %Isome(1:m1/2-1,1:n1/2-1) = P1_1;
% % Isome(1:m1/2-1,n1/2:end) = P2_1;
% % Isome(m1/2:end,1:n1/2-1) = P3_1;
% % Isome(m1/2:end,n1/2:end) = P4_1;
% figure, imshow(Isome);
% %  I2 = zeros(m,n);
%  I2 = Isome;

