clc;
close all;
clear all;
X = imread('jump.jpg');
[Rows,Cols,Channles]= size(X);
I = rgb2gray(X);
BW = edge(I,'canny');
figure, imshow(BW);
SE = strel('square',10);
Closed = imclose(BW,SE);
figure,imshow(Closed),title('After Closing');
SE2 = strel('rectangle',[6,6]);
Eroded = imerode(Closed,SE2);
figure,imshow(Eroded),title('After Erosion');
I2 = imread('jump2.jpg');
I2 = rgb2gray(I2);
R = zeros(Rows,Cols,'uint8');
for i=1:Rows
    for j=1:Cols
        for k=1:Channles
            if Eroded(i,j)==1
                R(i,j,k)=X(i,j,k);
            end
        end
    end
end

figure,imshow(R)
R = rgb2gray(R);
[L, num] = bwlabel(R);
Final = label2rgb(L);
figure,imshow(Final);
            