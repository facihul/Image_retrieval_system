function histout = LBP_histogram(I,bins)
%   %%% Copy code from matlab webpage
%   %%%% http://se.mathworks.com/help/vision/ref/extractlbpfeatures.html
% 
%      I = rgb2gray(im);
%      lbpFeatures = extractLBPFeatures(I,'CellSize',[32 32],'Normalization','None');
%      lbpCellHists = reshape(lbpFeatures,bins,[]);
%      lbpCellHists = bsxfun(@rdivide,lbpCellHists,sum(lbpCellHists));
%    %%% Reshape the LBP features vector back to 1-by- N feature vector.%%%%
%      histout = reshape(lbpCellHists,1,[]);

if (size(I, 3) == 3)
   I2 = rgb2gray(I);
 else I2 = I;
end

m=size(I2,1);
n=size(I2,2);
for i=2:m-1
    for j=2:n-1
        c=I2(i,j);
        I3(i-1,j-1)=I2(i-1,j-1)>c;
        I3(i-1,j)=I2(i-1,j)>c;
        I3(i-1,j+1)=I2(i-1,j+1)>c; 
        I3(i,j+1)=I2(i,j+1)>c;
        I3(i+1,j+1)=I2(i+1,j+1)>c; 
        I3(i+1,j)=I2(i+1,j)>c; 
        I3(i+1,j-1)=I2(i+1,j-1)>c; 
        I3(i,j-1)=I2(i,j-1)>c;
        LBP(i,j)=I3(i-1,j-1)*2^7+I3(i-1,j)*2^6+I3(i-1,j+1)*2^5+I3(i,j+1)*2^4+I3(i+1,j+1)*2^3+I3(i+1,j)*2^2+I3(i+1,j-1)*2^1+I3(i,j-1)*2^0;
    end
end
histout = imhist(LBP,12);



