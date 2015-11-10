function [] = Hough_lines(In)
% I = imread('building.jpg');
% I1 = rgb2gray(I);
rot = imrotate(In,33,'crop');
E1 = edge(rot,'Canny');
[H, T, R] = hough(E1, 'RhoResolution',1.0,'ThetaResolution',1.0);
peaks = houghpeaks(H,2);
imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,...
    'InitialMagnification','fit');
title('Hough Transform is');
axis on, axis normal; hold on;
colormap(hot);
x = T(peaks(:,2)); y = R(peaks(:,1));
plot(x,y,'s','color','white');
lines = houghlines(E1,T,R,peaks,'FillGap',5,'MinLength',7);
figure, imshow(rot), hold on;
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
hold off;
end

%lines = houghlines(E1,T,R,peaks);
% end