clear,clc,close all;
I=imread('C:\\Users\\ASUS\\Desktop\\11.png');
bw=rgb2gray(I);
bw=im2bw(I,graythresh(bw));
% bw2=~bw;
% figure,imshow(bw2)
[f c]=find(bw);%寻找出所有非零元素的位置,f是横坐标向量,c是纵坐标向量。
img_out=bw(min(f):max(f),min(c):max(c));%将图像四周的白点去掉
figure,imshow(img_out)
% img_out可能由于过渡第一列，到最后一列，第一行，最后一行没去掉，可以这样
% [m,n]=size(img_out);
% img_out=img_out(:,2:n-1);%去掉第一列和最后一列