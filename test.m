clear all 
clc

%%%%%%%%%%%%%%% jpeg compressed Image(real and texture) %%%%%%%%%
% imgPath = './jpeg/real_10/Images/';
% imgType = '*.jpg'; % change based on image type

%%%%%%%%%%%%%%%  Texture Image Path %%%%%%%%%%%%%%%
% imgPath = './texture_dbs/Images/';
% imgType = '*.tif'; % change based on image type

%%%%%%%%%%%%%%%  real Image Path %%%%%%%%%%%%%%%% 

imgPath = './realIm_dbs/Images/';
imgType = '*.jpg'; % change based on image type

images  = dir([imgPath imgType]);

%%%%%%%%%%  Colour feature Bins %%%%%%%%%%%%%%%%%% 
rgbBins=[4,4,4];
labBins=[8,4,4];
%%%%%%%%%%%%%%%%%% For LBP feature %%%%%
numNeighbors = 8;
LBPBins = numNeighbors*(numNeighbors-1)+3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
retrieved_Img = {20};
tp = 0; % True Positive 
fp = 0; % false Positive


%%%%%%%%%%%%%%%%%%%  
for idx = 1:length(images)
    Seq{idx} = imread([imgPath images(idx).name]);
    %GLCMS{idx} = Gray_level_CoOccuranceMat(Seq{idx},4,4);

    RGB{idx} = RGB_color_histogram(Seq{idx},rgbBins); % Color features
    %lab{idx} = Lab_color_histogram(Seq{idx},labBins); % Color features 
    %lbp{idx} = LBP_histogram(Seq{idx},LBPBins); % texture features (not done yet)
    
end
 
%%%% Retrieved results  color Images   %%%%%%%%%%%%

for i=1:length(images)
    %QI = GLCMS{i};
     QI = RGB{i};
     %QI = lab{i};
   for j = 1:length(images) 
       %temp = GLCMS{j};
    
       %temp = lab{j}; %% lab feature extract
       temp = RGB{j}; %% RGB feature extract 
       v(j)= Eucl_dist(QI,temp);
   
   end 
   [vs,I]= sort(v); %% sort the distance
   retrieved_Img = I(1:20); %% Take first 20 images;  
   

 %%%%%%%%%%%% Texture Image Retrieved result %%%%%%%%%%
%        retriev_resutl_texture = Image_class_for_texture(retrieved_Img);
%        F1_T(i) = AF1(retriev_resutl_texture,10);
%        retriev_resutl_texture = Class_label_for_ANMRR_T(retrieved_Img);
%        NMRR_T(i) = ANMRR(retriev_resutl_texture);
        
  %%%%%%%%%%%% Real Image Retrieved result %%%%%%%%%%     
        retriev_result =Image_class( retrieved_Img); % colour Image retrieval
        F1(i) = AF1(retriev_result,20);
        retrieval_results = Class_label_for_ANMRR(retrieved_Img); % colour Image retrieval 
        NMRR(i) = ANMRR(retrieval_results);      
 
       
end

%%%% Avarage Retrieved results  Texture Images %%%%%%%%%%%%%

% AF1_T_score = mean(F1_T)
% ANMRR_T_score = mean(NMRR_T)

%%%% Avarage  Retrieved results  Real Images %%%%%%%%%%%%% 

AF1_score = mean(F1)
ANMRR_score = mean(NMRR)


%%%%%%%%%%%%% Plot for single Image retrieval %%%%%
%  vec= retrieved_Img;
%  for i= 1:20
%  subplot(4,5,i), imshow(Seq{vec(i)})
%  end

%%%%%%%%%%%%%%%%% plot ends %%%%%%%%







 
 
