% 求一副灰度图像的均值
close all;
clear all;
clc;

imgp=imread('C:\Users\weng_lidan\Desktop\回声关系\强回声\强回声操作后3.png');% 两色图片
img=imread('C:\Users\weng_lidan\Desktop\回声关系\强回声\强回声3标注后.png');% 标注斑块后图片

% % 用来读取斑块位置大小||图片要求：斑块处为白色，其余为非白色
% imgp=rgb2gray(imgp);
% p1=(imgp==255);num1=sum(p1(:));%像素点为白的点数
% p2=(imgp~=0);num2=sum(p2(:));%像素点为非黑的点数
% num=(num1+num2)/2;%斑块所占像素点
num = getnumpoint(imgp);%暂时为黑白图片输入

imshow(img,[]);
img=rgb2gray(img);
[m,n]=size(img);
max=0;
min=255;
avg=0;
for i=1:1:m
    for j=1:1:n
        if img(i,j)<min
            min=img(i,j);
        end
        if img(i,j)>max
            max=img(i,j);
        end
        avg=avg+double(img(i,j));
    end
end
avg=uint8(avg/num)