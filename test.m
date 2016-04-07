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
%retrieved_Img = {20};
tp = 0;
fp=0;
%%%%%%%%%% class of color image %%%%%%
j=1;
for i=1:20:200
    classC(j,:)=[i:i+19];
    j=j+1;
end 
%%%%%%%%%%%%%%%%% class of texture Image %%%%

j=1;
for i=1:10:200
    classT(j,:)=[i:i+9];
    j=j+1;
end 

%%%%%%%%%%%%%%%%%%%  
for idx = 1:length(images)
    Seq{idx} = imread([imgPath images(idx).name]);
    RGB{idx} = RGB_color_histogram(Seq{idx},rgbBins); % Color features
    lab{idx} = Lab_color_histogram(Seq{idx},labBins); % Color features 
    %lbp{idx} = LBP_histogram(Seq{idx}); % texture features (not done yet)
    
end
 
%%%% Retrieved results  color Images   %%%%%%%%%%%%

for i=1:length(images)
     QI = RGB{i};
    % QI = lab{i};
   for j = 1:length(images) 
        
       %temp = lab{j}; %% lab feature extract
       temp = RGB{j}; %% RGB feature extract 
       v(j)= Eucl_dist(QI,temp);
   
   end 
   [vs,I]= sort(v); %% sort the distance
   retrieved_Img = I(1:20); %% Take first 20 images;
     
       % retriev_result =Image_class( retrieved_Img,classC);
        %F1(i) = AF1(retriev_result,20);
         retrieval_results = Class_label_for_ANMRR(retrieved_Img);  
          NMRR(i) = ANMRR(retrieval_results);
      
 
       
end

%AF1_score = mean(F1);
ANMRR_score = mean(NMRR);
%%%% Retrieved results  color Images %%%%%%%%%%%%


%  vec= a{1,56};
%  for i= 1:20
%  subplot(4,5,i), imshow(Seq{vec(i)})
%  end
% 
  
 









 
 
