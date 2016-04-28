clear all 
clc

%%%%%%%%%%%%%  For task 2 uncomment this part %%%%%%%%%

% imgPathR = './real_50/';%change based on dir name [real_50, real_40...  ]
% imgTypeR = '*.jpg'; 
% 
% imgPathT = './texture_50/';%change based on dir name [real_50, real_40...  ]
% imgTypeT = '*.jpg';


%%%%%%%%%%%%%  %%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%  For task 1 uncomment this part %%%%%%%%%
% 
% % %%%%%%%%%%%%%%  Texture Image Path %%%%%%%%%%%%%%%
imgPathT = './texture_dbs/Images/';
imgTypeT = '*.tif'; % change based on image type

%%%%%%%%%%%%%%  real Image Path %%%%%%%%%%%%%%%% 

imgPathR = './realIm_dbs/Images/';
imgTypeR = '*.jpg'; % change based on image type


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%

imagesR  = dir([imgPathR imgTypeR]);
imagesT  = dir([imgPathT imgTypeT]);




%%%%%%%%%%  Colour feature Bins %%%%%%%%%%%%%%%%%% 
rgbBins=[4,4,4];
labBins=[8,4,4];
%%%%%%%%%%%%%%%%%% For LBP feature %%%%%

LBPBins = 12;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
retrieved_Img = {20};
tp = 0; % True Positive 
fp = 0; % false Positive
 
win = 20; % window of top 38 retrieval Images
 


%%%%%%%%%%%%%%%%%%%  
for idx = 1:length(imagesR)
    Seq{idx} = imread([imgPathR imagesR(idx).name]);
    Seq_T{idx} = imread([imgPathT imagesT(idx).name]);
    %%%%%%%%%%%% Texture data %%%%%%
    GLCMS_T{idx} = Gray_level_CoOccuranceMat(Seq_T{idx},4,4);
    lbp_T{idx} = LBP_histogram(Seq_T{idx},LBPBins); % texture features (not done yet)
    
    %%%%%%%%%%%%%%%  Real data %%%%%%
    GLCMS{idx} = Gray_level_CoOccuranceMat(Seq{idx},4,4);
    lbp{idx} = LBP_histogram(Seq{idx},LBPBins); % texture features (not done yet)
    RGB{idx} = RGB_color_histogram(Seq{idx},rgbBins); % Color features
    lab{idx} = Lab_color_histogram(Seq{idx},labBins); % Color features 
    
end
 
%%%% Retrieved results  color Images   %%%%%%%%%%%%

for i=1:length(imagesR)
   %%%%%%%%%%%%%  Real data %%%%%% 
     QI_G = GLCMS{i};
     QI_R = RGB{i};
     QI_l = lab{i};
     QI_lb = lbp{i};
   %%%%%%%%%%%% Texture data %%%%%% 
        QI_TG = GLCMS_T{i};
        QI_Tlb = lbp_T{i};
       
   for j = 1:length(imagesR) 
     %%%%%%%%%%%%%  Real data %%%%%% 
       temp_G = GLCMS{j};
       temp_lb = lbp{j};
       temp_l = lab{j}; %% lab feature extract
       temp_R = RGB{j}; %% RGB feature extract 
     %%%%%%%%%%%% Texture data %%%%%%  
       temp_TG = GLCMS{j};
       temp_Tlb = lbp{j};
       v_TG(j)= Eucl_dist(QI_TG,temp_TG);
       v_Tlb(j)= Eucl_dist(QI_Tlb,temp_Tlb); 
     %%%%%%%%%%%%%  Real data %%%%%% 
       v_G(j)= Eucl_dist(QI_G,temp_G);
       v_R(j)= Eucl_dist(QI_R,temp_R);
       v_l(j)= Eucl_dist(QI_l,temp_l);
       v_lb(j)= Eucl_dist(QI_lb,temp_lb); 
      
   end 
   [vsG,IG]= sort(v_G); %% sort the distance
   retrieved_Img_G = IG(1:win); %% Take first 20 images;  
   [vsR,IR]= sort(v_R); %% sort the distance
   retrieved_Img_R = IR(1:win); %% Take first 20 images;  
   [vsl,Il]= sort(v_l); %% sort the distance
   retrieved_Img_l = Il(1:win); %% Take first 20 images;  
   [vslb,Ilb]= sort(v_lb); %% sort the distance
   retrieved_Img_lb = Ilb(1:win); %% Take first 20 images; 
  %%%%%%%%%%%% Texture data %%%%%% 
   [vTG,ITG]= sort(v_TG); %% sort the distance
   retrieved_Img_TG = ITG(1:win); %% Take first 20 images; 
   [vTlb,ITlb]= sort(v_Tlb); %% sort the distance
   retrieved_Img_Tlb = ITlb(1:win); %% Take first 20 images; 
   
 %%%%%%%%%%%% Texture Image Retrieved result %%%%%%%%%%
       retriev_resutl_texture = Image_class_for_texture(retrieved_Img_TG);
       F1_TG(i) = AF1(retriev_resutl_texture,10);
       NMRR_TG(i) = Class_label_for_ANMRR_T(retrieved_Img_TG);  % texture feature GLCM 
      % NMRR_TG(i) = ANMRR(retriev_resutl_texture);
        
        retriev_result =Image_class_for_texture( retrieved_Img_Tlb); 
        F1_Tlb(i) = AF1(retriev_result,10);
        NMRR_Tlb(i) = Class_label_for_ANMRR(retrieved_Img_Tlb);   % texture feature LBP
       % NMRR_Tlb(i) = ANMRR(retrieval_results);


  %%%%%%%%%%%% Real Image Retrieved result %%%%%%%%%%     
        retriev_result =Image_class( retrieved_Img_R);  
        F1_R(i) = AF1(retriev_result,20);
        NMRR_R(i) = Class_label_for_ANMRR(retrieved_Img_R);  % colour feature RGB
        %NMRR_R(i) = ANMRR(retrieval_results);
        
        retriev_result =Image_class( retrieved_Img_l); 
        F1_l(i) = AF1(retriev_result,20);
        NMRR_l(i) = Class_label_for_ANMRR(retrieved_Img_l);  % colour feature lab 
       % NMRR_l(i) = ANMRR(retrieval_results);
  
        retriev_result =Image_class( retrieved_Img_G); 
        F1_G(i) = AF1(retriev_result,20);
        NMRR_G(i) = Class_label_for_ANMRR(retrieved_Img_G);  % texture feature GLCM 
       % NMRR_G(i) = ANMRR(retrieval_results);      

        retriev_result =Image_class( retrieved_Img_lb); 
        F1_lb(i) = AF1(retriev_result,20);
        NMRR_lb(i) = Class_label_for_ANMRR(retrieved_Img_lb); % texture feature LBP
        %NMRR_lb(i) = ANMRR(retrieval_results);
       
end

%%%% Avarage Retrieved results  Texture Images %%%%%%%%%%%%%

AF1_T_score_G = mean(F1_TG);
ANMRR_T_score_G = mean(NMRR_TG);
AF1_Tl_score_l = mean(F1_Tlb);
ANMRR_Tl_score_l = mean(NMRR_Tlb);

%%%% Avarage  Retrieved results  Real Images %%%%%%%%%%%%% 

AF1_score_G = mean(F1_G);
ANMRR_score_G = mean(NMRR_G);
AF1_score_R = mean(F1_R);
ANMRR_score_R = mean(NMRR_R);
AF1_score_l = mean(F1_l);
ANMRR_score_l = mean(NMRR_l);
AF1_score_lb = mean(F1_lb);
ANMRR_score_lb = mean(NMRR_lb);

disp('REAl Image ')
disp([AF1_score_R ANMRR_score_R]);
disp([AF1_score_l ANMRR_score_l]);
disp([AF1_score_G ANMRR_score_G]);
disp([AF1_score_lb ANMRR_score_lb]);

disp('Texture Image')
disp([AF1_T_score_G ANMRR_T_score_G]);
disp([AF1_Tl_score_l ANMRR_Tl_score_l]);

%%%%%%%%%%%%% Plot for single Image retrieval %%%%%
%  vec= retrieved_Img_TG;
%  for i= 1:20
%  subplot(4,5,i), imshow(Seq_T{vec(i)})
%  end

%%%%%%%%%%%%%%%%% plot ends %%%%%%%%








 
 
