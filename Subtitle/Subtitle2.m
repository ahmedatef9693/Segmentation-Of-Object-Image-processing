clc;
clear all;
close all;
I = imread('Subtitle1.png');
GreyImage =rgb2gray(I);
[Rows,Cols] = size(GreyImage);

OpeningSE = strel('sphere',1);
DilationSE= strel('disk',1);
for i=1:Rows
    for j=1:Cols
        if GreyImage(i,j) <200
            GreyImage(i,j) = 0;
        end
        
    end
end
figure,imshow(GreyImage);

Opened = imopen(GreyImage,OpeningSE);
Difference = GreyImage-Opened;
Dilated = imdilate(Difference,DilationSE);
figure,imshow(Dilated);



