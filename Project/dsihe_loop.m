for i=180:10:230
    out = dsihe(h,i);
    figure, imshow(out); title(['dsihe brain',num2str(i)]);
    figure, imhist(out); title(['dsihe brain',num2str(i)]);
end