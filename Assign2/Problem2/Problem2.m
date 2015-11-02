RGB = imread('image_1_object.jpg');
% convert to gray scale
I = rgb2gray(RGB);

%Extract edges
BW = edge(I,'Canny');
[H, T, R] = hough(BW, 'RhoResolution',0.5,'ThetaResolution',0.5);
% Display original image
% subplot(2,1,1);
imshow(RGB);
title('Building image');

% Display the Hough matrix
% subplot(2,1,2);
% imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,...
%    'InitialMagnification','fit');
% title('Hough Transform of Building image');
% axis on, axis normal, hold on;
% colormap(hot);
[m,n] = size(H);
[m1,n1] = size(I);
I1 = zeros(m1,n1);
maxx = max(max(H));
maxx
%x = linspace(-10,10,1);
%xsize = size(x);

for i = 1:m
    for j = 1:n
        if(H(i,j)==maxx)
         i
         j
         r = R(i);
         t = T(j);
		 %y = (r - x*cos(t))/sin(t);
         x = round(abs(r*cos(t)));
         y = round(abs(r*sin(t)));
         x
         y
         if(x>0 && x<=m1 && y>0 && y<=n1)
            int = I(x,y);
            for k = 1:m1
                for l = 1:n1
                    if(I(k,l) < int)
                        I1(k,l)=0;
                    else
                        I1(k,l)=1;
                    end
                end
            end
            exit;
         end
        end
    end
end
%fprintf('the maximum is %f, at %d, %d\n',maxx,i,j);
% lets try to find the intensity of a point which lies on the line.
%figure, imshow(I1); title('Line detection using hough transform');
% end
%k=i; 
%l=j;
        