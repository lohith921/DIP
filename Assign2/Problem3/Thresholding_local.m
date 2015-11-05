function [ I1 ] = Thresholding_local( I,win )
% this function is used to split actual image into blocks of mentioned size
% and calls the local_thresholding function.
[m,n]=size(I);
j=1;
i=1;
I1 = zeros(m,n);
A=zeros(win,win);
while(i<=(m-win))
    A=I(i:(i-1)+win,j:(j-1)+win);
    I1(i:(i-1)+win,j:(j-1)+win)=local_thresholding(A);
    j=j+win;
    if((j+win)==n)
        i=i+win;
        j=1;
    end
end

