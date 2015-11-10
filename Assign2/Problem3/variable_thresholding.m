function [ Iout ] = variable_thresholding( In )
% computing mean
m = mean(mean(In));
% local standard deviation of image
variance = stdfilt(In,ones(5));
%size(variance)
Iout = (In > variance) & (In > m);
% figure, imshow(I2); title('variable thresholding');
end

