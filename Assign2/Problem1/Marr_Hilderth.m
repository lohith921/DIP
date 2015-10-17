clear all
%I=imread('building image.jpg');
%I=imread('image_1_object.jpg');
I=imread('indoor_image.jpeg');
I1=rgb2gray(I);
I1=im2double(I1);
%smoothening the image with a filter
gfilter= [0 0 1 0 0;
       0 1 2 1 0;
       1 2 -16 2 1;
       0 1 2 1 0;
       0 0 1 0 0];
   
smim=conv2(I1,gfilter);
% finding the zero crossings
[rr,cc]=size(smim);
zc=zeros([rr,cc]);

for i=2:rr-1
    for j=2:cc-1
        if (smim(i,j)>0)
             if (smim(i,j+1)>=0 && smim(i,j-1)<0) || (smim(i,j+1)<0 && smim(i,j-1)>=0)
                   
                zc(i,j)= smim(i,j+1);
                        
            elseif (smim(i+1,j)>=0 && smim(i-1,j)<0) || (smim(i+1,j)<0 && smim(i-1,j)>=0)
                    zc(i,j)= smim(i,j+1);
            elseif (smim(i+1,j+1)>=0 && smim(i-1,j-1)<0) || (smim(i+1,j+1)<0 && smim(i-1,j-1)>=0)
                  zc(i,j)= smim(i,j+1);
            elseif (smim(i-1,j+1)>=0 && smim(i+1,j-1)<0) || (smim(i-1,j+1)<0 && smim(i+1,j-1)>=0)
                  zc(i,j)=smim(i,j+1);
            end
                        
        end
            
    end
end

I2=im2uint8(zc);
% thresholding
otptth= I2>105;

if 0
 figure;
  subplot(2,2,1);imshow(I1);title('Origional image');
  subplot(2,2,2);imshow(smim);title('Smoothened image');
  subplot(2,2,3);imshow(I2);title('Output image');
  subplot(2,2,4);imshow(otptth);title('Output image with threshold');
end

  % final result
   figure, imshow(otptth);title('Output image with threshold');