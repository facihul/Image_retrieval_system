close all 
clear all
clc

%%%%%%%%%%%%%%% jpeg compressed Image(real and texture) %%%%%%%%%
comp_vec= [50,40,30,20,10];
for i= 1:5
jpegcompression(comp_vec(i)); % change parameter according to comp_vec.
end

%%%%%%%%%%%%%%%% Remove all sub follder created %%%%%%%%%%%%
% Uncomment the line below if the folder is to be removed %%%%%%%%%%

% removefolder;

