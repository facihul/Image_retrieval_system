function histout = LBP_histogram(im,bins)
  %%% Copy code from matlab webpage
  %%%% http://se.mathworks.com/help/vision/ref/extractlbpfeatures.html

     I = rgb2gray(im);
     lbpFeatures = extractLBPFeatures(I,'CellSize',[32 32],'Normalization','None');
     lbpCellHists = reshape(lbpFeatures,bins,[]);
     lbpCellHists = bsxfun(@rdivide,lbpCellHists,sum(lbpCellHists));
   %%% Reshape the LBP features vector back to 1-by- N feature vector.%%%%
     histout = reshape(lbpCellHists,1,[]);

 