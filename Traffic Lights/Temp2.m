clc;
clear all;
close all;
I = imread('2.jpg');
GreyImage = rgb2gray(I);

R = I(:,:,1);
G = I(:,:,2);
Y = I(:,:,1)+I(:,:,2);
[Rows,Cols] = size(R);
RedBright = 0;
GreenBright = 0;
YellowBright = 0;
%S = impixel(GreyImage);
figure,imshow(Y);
for i=1:Rows
    for j=1:Cols
        if I(i,j,1)==255 
            RedBright = RedBright+1;
            I(i,j,:) =0 ;
        end
        if I(i,j,2)==255 
            GreenBright = GreenBright+1;
            I(i,j,:) =0 ;
        end
        if I(i,j,1)==255 && I(i,j,2)==255
            YellowBright = YellowBright+1;
            I(i,j,:) =0 ;
        end
            
            
        

    end
end
figure,imshow(I);
disp('Done');


