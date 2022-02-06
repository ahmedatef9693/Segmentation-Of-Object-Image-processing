clc;
clear all;
close all;
I = imread('4.jpg');
%Converting Image To GreyScale
GreyImage = rgb2gray(I);
%Getting  its binary values zeros and ones only
BinaryImage = imbinarize(GreyImage);
%Applying Complement To Image To For Applying Morphology Operations After
%That
ComplementOfImage = imcomplement(BinaryImage);
%Filling Holes In Image If Existed
FillHoles = imfill(ComplementOfImage,'holes');

%Removing Small Objects From Binary Image containing Less Than 10k Pixels
RemovingObjects = bwareaopen(FillHoles,10000);
%Structuring Element For Erosion
SE1 = strel('disk',60);
%Structuring Element For Dialation
SE2 = strel('disk',110);
%Applying Erosion
ErodedImage = imerode(RemovingObjects,SE1);
%Applying Dialation
DilatedImage = imdilate(ErodedImage,SE2);
%Getting Defrence 
Fingers = RemovingObjects - DilatedImage;

%Making intesities of image which has -1 equal to 0 its like cutoff
Fingers(Fingers == -1)=0;
Fingers = logical(Fingers);
%Removing Again Objects which has less Than 1K Pixels
Fingers = bwareaopen(Fingers,1000);

%GetConnected Components
ConnectedComponents = bwconncomp(Fingers);
%Getting Number Of Objects In Connected Components
NumberOfFingers = ConnectedComponents.NumObjects;
figure,imshow(Fingers);
disp('Done Hand Sign');
