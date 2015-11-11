function [out] = bubo(In, alpha)
% program for contrast enhancement using bin underflow and bin overflow mechanism
% The corresponding paper is CONTRAST ENHANCEMENT USING HISTOGRAM EQUALIZATION
% WITH BIN UNDERFLOWAND BIN OVERFLOW
[M,N]=size(In);
Cbu = (1-alpha)/M*N;
Cbo = (1+alpha)/M*N;
 K = 256;
 p[K]; % probability density function
 for i=1:K
    temp = find(In==(i-1));
	nk = size(temp);
	p(i) = nk/M*N;
 end
 pn[K]; % modified probability density function
 for i = 1:K
    if( p(i)>Cbo)
	  pn(i)=Cbo;
	  elseif( p(i)<Cbu)
	  pn(i)=Cbu;
	  else
	  pn(i)=p(i);
	end
 end
 % cumulative distribution function
 C[K];
 for i=1:K
  for j=1:i
    su = su+pn(j);
  end
  C(i)=su;
 end
 Iout = In;
 for i=1:M
  for j=1:N
   k = In(i,j);
   t= (C[K]/K).K;
   t1 = K*(C[k]-t)+k;
   Iout(i,j) = t1;
  end
 end
 end
 % end of program.
 