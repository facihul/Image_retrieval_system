clear all 
close all
clc
compression = [100,50,40,30,20,10];

%%% colour 
RGB = [0.2953,0.2430,0.2437,0.2432,0.2438,0.2452];
LAB = [0.2863,0.2522,0.2545,0.2525,0.2522,0.2632];
GLCM = [0.2607,0.2145,0.2130,0.2113,0.2128,0.2163];
LBP = [0.2207,0.2088,0.2148,0.2087,0.2142,0.1955];

%%% texure
GLCMT = [0.1783,0.1813,0.1870,0.1860,0.1857,0.2010];
LBPT = [0.2053,0.1867,0.1230,0.1323,0.1497,0.1287];

figure,
plot(compression, RGB,'red', compression, LAB,'black',compression, GLCM,'blue',compression, LBP,'cyan');
grid on;
title('AF1 Score for Real Image')
xlabel('compression ratio')
ylabel('AF1 ')
legend('RGB=red','LAB=black','GLCM = blue', 'LBP = cyan');

figure,
plot(compression,GLCMT,'blue',compression, LBPT,'red');
grid on;
title('AF1 Score for textute Image')
xlabel('compression ratio')
ylabel('AF1 ')
legend('GLCM = blue', 'LBP = red');