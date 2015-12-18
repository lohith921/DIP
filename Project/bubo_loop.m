% script to run bubo for certain chosen alpha values
for i=0:0.125:4
    out = bubo(O,i);
     figure, subplot(2,1,1), imshow(out); title(['bubo ',num2str(i)]);
     subplot(2,1,2), imhist(out); title(['bubo ',num2str(i)]);
end