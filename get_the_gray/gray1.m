% 求一副灰度图像的均值
close all;
clear all;
clc;
% i=imread('C:\Users\LQ\Desktop\低回声.png'); %载入真彩色图像
% i=rgb2gray(i); %转换为灰度图
% i=double(i);  %将uint8型转换为double型，否则不能计算统计量
% % avg1=mean(i,1); %列向量均值
% % avg2=mean(i,2); %行向量均值
% % avg3=mean(i); %列向量均值
% [m,n]=size(i);
% s=0;
% for x=1:m
%     for y=1:n
%         s=s+i(x,y); %求像素值总和 s
%     end
% end
% %所有像素均值
% a1=mean(mean(i)); %第一种方法：先计算列向量均值，再求总均值。
% % a2=mean2(i); %第二种方法：用函数mean2求总均值
% % a3=s/(m*n);  %第三种方法：按公式计算，像素值总和除以像素个数。
% % a4=sum(sum(i))/(m*n); %第四种方法：也是按公式计算，但是用sum来求像素值总和。

% 用来读取斑块位置大小||图片要求：斑块处为白色，其余为非白色
imgp=imread('C:\Users\weng_lidan\Desktop\强回声\强回声操作后3.png');
imgp=rgb2gray(imgp);
p1=(imgp==255);num1=sum(p1(:));%像素点为白的点数
p2=(imgp~=0);num2=sum(p2(:));%像素点为非黑的点数
num=(num1+num2)/2;%斑块所占像素点

img=imread('C:\Users\weng_lidan\Desktop\强回声\强回声3标注后.png');
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
% avg=uint8(avg/(m*n));
avg=uint8(avg/num)