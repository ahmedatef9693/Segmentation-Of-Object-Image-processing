clc;
clear all;
close all;
I = imread('Mobinil.bmp');

figure,imshow(I);

GreyImage =rgb2gray(I);

figure,imshow(GreyImage);
figure,imhist(GreyImage);
[Rows,Cols] = size(GreyImage);
SE = strel('disk',1);
for i=1:Rows
    for j=1:Cols
        if GreyImage(i,j) >210 && GreyImage(i,j)<245
            GreyImage(i,j)=255;
        else
            GreyImage(i,j)=0;
        end
      
  
    end
end
figure,imshow(GreyImage);

