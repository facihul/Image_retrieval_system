
close all 
clear all
clc

%%%%%%%%%%%%%%% remove all subfolder creqated for performance calculation %%%%%%%%%

for i= 10:10:50
  S = int2str(i);
  dirname1= strcat('real_',S);
  dirname2= strcat('texture_',S);
  rmdir(dirname1,'s');  
  rmdir(dirname2,'s');
    
end
