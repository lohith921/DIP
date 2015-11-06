function [threshold_otsu] = Thresholding_Otsu( Image)
%(1)pixels are divided into two groups
%(2)pixels within each group are very similar to each other 
%   Parameters:
%   t : threshold 
%   r : pixel value ranging from 1 to 255
%   q_L, q_H : the number of lower and higher group respectively
%   sigma : group variance
%   miu : group mean
%   for multi children Otsu method, please visit
%nbins = 256;
if 0
    counts = imhist(Image,nbins);
p = counts/sum(counts);
for t =1 : nbins
   q_L = sum(p(1 : t));
   q_H = sum(p(t+1 : end));
   miu_L = sum(p(1 : t) .* (1 : t)') / q_L;
   miu_H = sum(p(t +1 : end) .* (t +1 : nbins)') / q_H;
   sigma_b(t) = q_L * q_H * (miu_L - miu_H)^2;
end
[~,threshold_otsu] = max(sigma_b(:));
end
level = graythresh(Image);
BW = im2bw(Image,level);
threshold_otsu=BW;