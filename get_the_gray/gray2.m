% ��һ���Ҷ�ͼ��ľ�ֵ
close all;
clear all;
clc;

imgp=imread('C:\Users\weng_lidan\Desktop\������ϵ\ǿ����\ǿ����������3.png');% ��ɫͼƬ
img=imread('C:\Users\weng_lidan\Desktop\������ϵ\ǿ����\ǿ����3��ע��.png');% ��ע�߿��ͼƬ

% % ������ȡ�߿�λ�ô�С||ͼƬҪ�󣺰߿鴦Ϊ��ɫ������Ϊ�ǰ�ɫ
% imgp=rgb2gray(imgp);
% p1=(imgp==255);num1=sum(p1(:));%���ص�Ϊ�׵ĵ���
% p2=(imgp~=0);num2=sum(p2(:));%���ص�Ϊ�Ǻڵĵ���
% num=(num1+num2)/2;%�߿���ռ���ص�
num = getnumpoint(imgp);%��ʱΪ�ڰ�ͼƬ����

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