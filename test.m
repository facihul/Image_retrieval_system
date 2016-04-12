clear all 
clc


%imgPath = './jpeg/real_50/Images/';
imgPathR = './real_10/';%change based on dir name [real_50, real_40...  ]
imgType = '*.jpg'; % change based on image type

imgPathT = './texture_10/';%change based on dir name [real_50, real_40...  ]

%%%%%%%%%%%%%%%  Texture Image Path %%%%%%%%%%%%%%%
% imgPath = './texture_dbs/Images/';
% imgType = '*.tif'; % change based on image type

%%%%%%%%%%%%%%%  real Image Path %%%%%%%%%%%%%%%% 

% imgPath = './realIm_dbs/Images/';
% imgType = '*.jpg'; % change based on image type

%%%%%%%%%%%%%%%  for compressed image %%%%%%%%
imagesR  = dir([imgPathR imgType]);
imagesT  = dir([imgPathT imgType]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% for uncompressed image %%%%%%%%

%images  = dir([imgPath imgType]);

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
for idx = 1:length(imagesR)
    Seq{idx} = imread([imgPathR imagesR(idx).name]);
    Seq_T{idx} = imread([imgPathT imagesT(idx).name]);
    %%%%%%%%%%%% Texture data %%%%%%
    GLCMS_T{idx} = Gray_level_CoOccuranceMat(Seq_T{idx},4,4);
    %lbp_T{idx} = LBP_histogram(Seq_T{idx},LBPBins); % texture features (not done yet)
    
    %%%%%%%%%%%%%%%  Real data %%%%%%
    GLCMS{idx} = Gray_level_CoOccuranceMat(Seq{idx},4,4);
    %lbp{idx} = LBP_histogram(Seq{idx},LBPBins); % texture features (not done yet)
    RGB{idx} = RGB_color_histogram(Seq{idx},rgbBins); % Color features
    lab{idx} = Lab_color_histogram(Seq{idx},labBins); % Color features 
    %lbp{idx} = LBP_histogram(Seq{idx},LBPBins); % texture features (not done yet)
    
end
 
%%%% Retrieved results  color Images   %%%%%%%%%%%%

for i=1:length(imagesR)
   %%%%%%%%%%%%%  Real data %%%%%% 
     QI_G = GLCMS{i};
     QI_R = RGB{i};
     QI_l = lab{i};
     %QI_lb = lbp{i};
   %%%%%%%%%%%% Texture data %%%%%% 
        QI_TG = GLCMS_T{i};
       %QI_Tlb = lbp_T{i};
       
   for j = 1:length(imagesR) 
     %%%%%%%%%%%%%  Real data %%%%%% 
       temp_G = GLCMS{j};
      %temp_lb = lbp{j};
       temp_l = lab{j}; %% lab feature extract
       temp_R = RGB{j}; %% RGB feature extract 
     %%%%%%%%%%%% Texture data %%%%%%  
       temp_TG = GLCMS{j};
      %temp_Tlb = lbp{j};
       v_TG(j)= Eucl_dist(QI_TG,temp_TG);
      % v_Tlb(j)= Eucl_dist(QI_Tlb,temp_Tlb); 
     %%%%%%%%%%%%%  Real data %%%%%% 
       v_G(j)= Eucl_dist(QI_G,temp_G);
       v_R(j)= Eucl_dist(QI_R,temp_R);
       v_l(j)= Eucl_dist(QI_l,temp_l);
      % v_lb(j)= Eucl_dist(QI_lb,temp_lb); 
      
   end 
   [vsG,IG]= sort(v_G); %% sort the distance
   retrieved_Img_G = IG(1:20); %% Take first 20 images;  
   [vsR,IR]= sort(v_R); %% sort the distance
   retrieved_Img_R = IR(1:20); %% Take first 20 images;  
   [vsl,Il]= sort(v_l); %% sort the distance
   retrieved_Img_l = Il(1:20); %% Take first 20 images;  
   
   %[vslb,Il]= sort(v_lb); %% sort the distance
   %retrieved_Img_lb = Ilb(1:20); %% Take first 20 images; 
  %%%%%%%%%%%% Texture data %%%%%% 
   [vTG,ITG]= sort(v_TG); %% sort the distance
   retrieved_Img_TG = ITG(1:20); %% Take first 20 images; 
  %[vTlb,ITlb]= sort(v_Tlb); %% sort the distance
   %retrieved_Img_lb = ITlb(1:20); %% Take first 20 images; 
   
 %%%%%%%%%%%% Texture Image Retrieved result %%%%%%%%%%
       retriev_resutl_texture = Image_class_for_texture(retrieved_Img_TG);
       F1_TG(i) = AF1(retriev_resutl_texture,10);
       retriev_resutl_texture = Class_label_for_ANMRR_T(retrieved_Img_TG);
       NMRR_TG(i) = ANMRR(retriev_resutl_texture);
        
%         retriev_result =Image_class( retrieved_Img_lb); % colour Image retrieval
%         F1_Tlb(i) = AF1(retriev_result,20);
%         retrieval_results = Class_label_for_ANMRR(retrieved_Img_lb); % colour Image retrieval 
%         NMRR_Tlb(i) = ANMRR(retrieval_results);


  %%%%%%%%%%%% Real Image Retrieved result %%%%%%%%%%     
        retriev_result =Image_class( retrieved_Img_G); % colour Image retrieval
        F1_G(i) = AF1(retriev_result,20);
        retrieval_results = Class_label_for_ANMRR(retrieved_Img_G); % colour Image retrieval 
        NMRR_G(i) = ANMRR(retrieval_results);      
 
        retriev_result =Image_class( retrieved_Img_R); % colour Image retrieval
        F1_R(i) = AF1(retriev_result,20);
        retrieval_results = Class_label_for_ANMRR(retrieved_Img_R); % colour Image retrieval 
        NMRR_R(i) = ANMRR(retrieval_results);
        
        retriev_result =Image_class( retrieved_Img_l); % colour Image retrieval
        F1_l(i) = AF1(retriev_result,20);
        retrieval_results = Class_label_for_ANMRR(retrieved_Img_l); % colour Image retrieval 
        NMRR_l(i) = ANMRR(retrieval_results);
        
%         retriev_result =Image_class( retrieved_Img_lb); % colour Image retrieval
%         F1_lb(i) = AF1(retriev_result,20);
%         retrieval_results = Class_label_for_ANMRR(retrieved_Img_lb); % colour Image retrieval 
%         NMRR_lb(i) = ANMRR(retrieval_results);
       
end

%%%% Avarage Retrieved results  Texture Images %%%%%%%%%%%%%

AF1_T_score_G = mean(F1_TG);
ANMRR_T_score_G = mean(NMRR_TG);
% AF1_Tl_score_l = mean(F1_Tlb);
% ANMRR_Tl_score_l = mean(NMRR_Tlb);

%%%% Avarage  Retrieved results  Real Images %%%%%%%%%%%%% 

AF1_score_G = mean(F1_G);
ANMRR_score_G = mean(NMRR_G);
AF1_score_R = mean(F1_R);
ANMRR_score_R = mean(NMRR_R);
AF1_score_l = mean(F1_l);
ANMRR_score_l = mean(NMRR_l);
% AF1_score_lb = mean(F1_lb);
% ANMRR_score_lb = mean(NMRR_lb);

disp([AF1_score_R ANMRR_score_R]);
disp([AF1_score_l ANMRR_score_l]);
disp([AF1_score_G ANMRR_score_G]);
%disp([AF1_score_lb ANMRR_score_lb]);


disp([AF1_T_score_G ANMRR_T_score_G]);
%disp([AF1_T_score_l ANMRR_score_T_l]);

%%%%%%%%%%%%% Plot for single Image retrieval %%%%%
%  vec= retrieved_Img;
%  for i= 1:20
%  subplot(4,5,i), imshow(Seq{vec(i)})
%  end

%%%%%%%%%%%%%%%%% plot ends %%%%%%%%








 
 
