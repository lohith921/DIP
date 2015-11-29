function [ Iout ] = ad_medianfilter(In, Winsize)
% this function performs the adaptive meadin filtering.
% The median filter starts at size 3x3 and iterates up
% to size Winsize-x-Winsize. Winsize(Window size) must be an odd integer greater than 1
% checking if window size is odd integer and >1
if (Winsize <= 1) || (Winsize/2 == round(Winsize/2)) || (Winsize ~= round(Winsize))
    error('Window size must be an odd integer > 1')
end
Itemp = In;
Itemp(:) = 0;
processedFlag = false(size(In));
% filtering starts here
for sz = 3:2:Winsize
    Zmin = ordfilt2(In, 1, ones(sz, sz), 'symmetric');
    Zmax = ordfilt2(In, sz * sz, ones(sz, sz), 'symmetric');
    Zmed = medfilt2(In, [sz sz]);
    processUsingLevelB = (Zmed > Zmin) & (Zmax > Zmed) & ~processedFlag;
    zB = (In > Zmin) & (Zmax > In);
    outputZxy  = processUsingLevelB & zB;
    outputZmed = processUsingLevelB & ~zB;
    Itemp(outputZxy) = In(outputZxy);
    Itemp(outputZmed) = Zmed(outputZmed);
    processedFlag = processedFlag | processUsingLevelB;
    if all(processedFlag(:))
        break;
    end
end
Iout = Itemp;
end