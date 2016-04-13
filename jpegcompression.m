
function  jpegcompression(q)

%%%%%%%%%%%%%%%  real Image Path %%%%%%%%%%%%%%%% 
imgPathR = './realIm_dbs/Images/';
imgTypeR = '*.jpg'; % change based on image type
imagesR  = dir([imgPathR imgTypeR]);
%%%%%%%%%%%%%%%  Texture Image Path %%%%%%%%%%%%%%%
imgPath = './texture_dbs/Images/';
imgType = '*.tif'; % change based on image type

imagesT  = dir([imgPath imgType]);

S = int2str(q);

dirname1= strcat('real_',S);
dirname2= strcat('texture_',S);
mkdir(dirname1);
mkdir(dirname2);

for idx=1:200 
    Seq{idx} = imread([imgPathR imagesR(idx).name]);
    S = int2str(idx);
    filename=strcat('Img',S,'.jpg');
    filename = fullfile(dirname1,filename);
    imwrite(Seq{idx},filename,'jpg','Quality',q);
    
end 


for idx=1:200 
    Seq{idx} = imread([imgPath imagesT(idx).name]);
    S = int2str(idx);
    filename=strcat('Img',S,'.jpg');
    filename = fullfile(dirname2,filename);
    imwrite(Seq{idx},filename,'jpg','Quality',q);
    
end 



