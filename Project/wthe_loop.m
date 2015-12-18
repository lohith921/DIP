% loop for wthe to vary power in power law function
for i=0.5:0.125:1.5
    out = wthe(cont,i);
    figure, subplot(2,1,1), imshow(out); title(['hill wthe r=',num2str(i)]);
    subplot(2,1,2), imhist(out); title(['hill histogram wthe']);
end