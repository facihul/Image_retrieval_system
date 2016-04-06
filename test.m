clear all 
clc
% imgPath = './texture_dbs/Images/';
% imgType = '*.tif'; % change based on image type
% 
imgPath = './realIm_dbs/Images/';
imgType = '*.jpg'; % change based on image type

images  = dir([imgPath imgType]);
%%%   Bins %% 
rgbBins=[4,4,4];
labBins=[8,4,4];


for idx = 1:length(images)
    Seq{idx} = imread([imgPath images(idx).name]);
    RGB{idx} = RGB_color_histogram(Seq{idx},rgbBins); % Color features
    lab{idx} = Lab_color_histogram(Seq{idx},labBins); % Color features 
    %lbp{idx} = LBP_histogram(Seq{idx}); % texture features (not done yet)
    
end
 
% %%%% Quary  Image  %%%%
for i=1:length(images)
     QI = RGB{i};
   for j = 1:length(images) 
      
       temp = RGB{j};
       %dist =sqrt(sum((QI-temp).^2));
       v(j)= Eucl_dist(QI,temp);
   
   end 
       [vs,I]= sort(v); %% sort the distance
       a{i}= I(1:20); %% Take first 20 images;
end

%%%% Retrieved results %%%%%%%%%%%%


 vec= a{1,21};
 for i= 1:20
 subplot(4,5,i), imshow(Seq{vec(i)})
 end
