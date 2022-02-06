%Apply For ('4.png') and ('5.png') and ('6.png')
clc;
clear all;
close all;
%I = imread('4.png');
%Uncomment Next Line To Get Rest Of Images Output
%I = imread('5.png');
I = imread('6.png');
GreyImage = rgb2gray(I);
[Rows,Cols] = size(GreyImage);
RedBright = 0;
GreenBright = 0;
YellowBright = 0;
%S = impixel(GreyImage);
% I Have Used impixel To Detect The Intensities Firstly Then I Will Use
% Segmentation Depending On Thresholding

for i=1:Rows
    for j=1:Cols
        if (GreyImage(i,j) >= 62) && (GreyImage(i,j) <=77) 
            RedBright = RedBright+1;
            GreyImage(i,j) =255;
        elseif (GreyImage(i,j) >= 131) && (GreyImage(i,j) <=203)
            YellowBright =YellowBright+ 1;
            GreyImage(i,j) =255;
        elseif (GreyImage(i,j) >= 58) && (GreyImage(i,j) <=187)
            GreenBright =GreenBright+1;
            GreyImage(i,j) =255;
        else
            GreyImage(i,j) =0;
        end
        
    end
end
%Filling Holes
Filled = imfill(GreyImage,'holes');
%figure,imshow(Filled);
if (RedBright > GreenBright) && (RedBright>YellowBright)
    disp('The Sign Is Red');
elseif (GreenBright > RedBright) && (GreenBright>YellowBright)
    disp('The Sign Is Green');
elseif (YellowBright > RedBright) && (YellowBright > GreenBright)
    disp('The Sign Is Yellow');
end