clc;
clear all;
close all;
I = imread('Subtitle1.png');
[Rows,Cols,Ch] = size(I);

J = imnoise(I,'salt & pepper',0.000002);
figure,imshow(J);
            
            
                
                