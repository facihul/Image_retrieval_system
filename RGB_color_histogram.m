function histout = RGB_color_histogram(I,bins)
%RGBHIST   Histogram of RGB values.

if (size(I, 3) ~= 3)
    error('rgbhist:numberOfSamples', 'Input image must be RGB.')
end



rHist = imhist(I(:,:,1), bins(1));
gHist = imhist(I(:,:,2), bins(2));
bHist = imhist(I(:,:,3), bins(3));

histout = [rHist',gHist',bHist'];