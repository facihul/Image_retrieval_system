clear all 
close all
clc
compression = [100,50,40,30,20,10];
%%% colour 
RGB = [ 0.7446,0.7994,0.7985,0.7995,0.7989,0.7979,];
LAB = [0.7527,0.7892,0.7880,0.7868,0.7898,0.7777];
GLCM = [0.7816,0.8283,0.8290,0.8300,0.8289,0.8271];
LBP = [0.8286,0.8391,0.8322,0.8382,0.8322,0.8510];

%%% texure
GLCMT = [0.8510,0.8412,0.8362,0.8388,0.8283,0.8274];
LBPT = [0.8759,0.8983,0.8667,0.9174,0.8736,0.8852];

figure,
plot(compression, RGB,'red', compression, LAB,'black',compression, GLCM,'blue',compression, LBP,'cyan');
grid on;
title('ANMRR Score for Real Image')
xlabel('compression ratio')
ylabel('ANMRR ')
legend('RGB=red','LAB=black','GLCM = blue', 'LBP = cyan');

figure,
plot(compression,GLCMT,'blue',compression, LBPT,'red');
grid on;
title('ANMRR Score for textute Image')
xlabel('compression ratio')
ylabel('ANMRR ')
legend('GLCM = blue', 'LBP = red');