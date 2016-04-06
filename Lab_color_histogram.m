function histout = Lab_color_histogram(im,bins)

labTransformation = makecform('srgb2lab');
labI = applycform(im,labTransformation);

l = labI(:,:,1);
a = labI(:,:,2);
b = labI(:,:,3);


lHist = imhist(l, bins(1));
aHist = imhist(a, bins(2));
bHist = imhist(b, bins(3));

histout = [lHist',aHist',bHist'];