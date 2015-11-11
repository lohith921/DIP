function [ out ] = wthe(In, up, low, r)
% Weighted thresholded intensity transformation program
% Paper: Fast Image/Video Contrast Enhancement Based on Weighted
% Thresholded Histogram Equalization 
[m,n] = size(In);
 K = 256;
 p[K];
 for i=1:K
    temp = find(In==(i-1));
	nk = size(temp);
	p(i) = nk/m*n;
 end
 % weighted probability function
 pwt[K]; 
 for i = 1:K
    if( p(i)>up)
	  pwt(i)=up;
	  elseif( p(i)<low)
	  pwt(i)=0;
	  else
	  t = (p(i)-low)/(up-low);
	  t1 = pow(t,r)*up;
	  pwt(i)=t1;
	end
 end
 % cumulative distribution function
 Cwt[K];
 for i=1:K
  for j=1:i
    su = su+pwt(j);
  end
  Cwt(i)=su;
 end
 Inew = In;
 % temporary parameter values
 Wout = K-1;
 Madj = 0;
 for i=1:m
  for j=1:n
   Inew(i,j)=Wout*Cwt[In(i,j)]+Madj;
  end
 end
 out = Inew
 end
 % end of program

