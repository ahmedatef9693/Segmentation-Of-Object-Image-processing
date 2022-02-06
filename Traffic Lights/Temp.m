clc;
clear all;
close all;
I = imread('4.png');
GreyImage = rgb2gray(I);
[Rows,Cols] = size(GreyImage);
RedBright = 0;
GreenBright = 0;
YellowBright = 0;
%S = impixel(GreyImage);

for i=1:Rows
    for j=1:Cols
        if  (GreyImage(i,j) >= 40) && (GreyImage(i,j) <=72)
            RedBright = RedBright+1;
            GreyImage(i,j) =255;
        elseif (GreyImage(i,j) >= 187) &&( GreyImage(i,j) <=203)
            YellowBright =YellowBright+ 1;
            GreyImage(i,j) =255;
        elseif (GreyImage(i,j) > 72) && (GreyImage(i,j) <187)
            GreenBright =GreenBright+1;
            GreyImage(i,j) =255;
        else
            GreyImage(i,j) =0;
        end
        
    end
end
figure,imshow(GreyImage);
if (RedBright > GreenBright) && (RedBright>YellowBright)
    disp('The Sign Is Red');
elseif (GreenBright > RedBright) && (GreenBright>YellowBright)
    disp('The Sign Is Green');
elseif (YellowBright > RedBright) && (YellowBright > GreenBright)
    disp('The Sign Is Yellow');
end