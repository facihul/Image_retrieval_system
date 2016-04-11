function histout = Gray_level_CoOccuranceMat(I,dx,dy)
if (size(I, 3) == 3)
   im = rgb2gray(I);
 else im = I;
end



p=[dx,dy]; 
histout = graycomatrix(im,'Offset',p);
[n,m] = size(histout);

histout = reshape(histout,1,n*m);