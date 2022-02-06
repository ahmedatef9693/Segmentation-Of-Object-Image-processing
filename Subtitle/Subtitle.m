clc;
clear all;
close all;
I = imread('Subtitle1.png');
GreyImage =rgb2gray(I);

ClosedSE= strel('disk',1);
figure,imshow(GreyImage);
OpeningSE = strel('sphere',1);
Opened = imopen(GreyImage,OpeningSE);

[Rows,Cols] = size(GreyImage);
%Difference Will Remove Large Objects for Top Hat Transform
Difference = GreyImage-Opened;
%Increasing Size Of Letters in Subtitle
Closed = imclose(Difference,ClosedSE);
figure,imshow(Closed);


%Histogram Thresholding
for i=1:Rows
    for j=1:Cols
        if Closed(i,j) <30
            Closed(i,j) = 0;
        end
        
    end
end

figure,imshow(Closed);