% ��һ���Ҷ�ͼ��ľ�ֵ
close all;
clear all;
clc;
% i=imread('C:\Users\LQ\Desktop\�ͻ���.png'); %�������ɫͼ��
% i=rgb2gray(i); %ת��Ϊ�Ҷ�ͼ
% i=double(i);  %��uint8��ת��Ϊdouble�ͣ������ܼ���ͳ����
% % avg1=mean(i,1); %��������ֵ
% % avg2=mean(i,2); %��������ֵ
% % avg3=mean(i); %��������ֵ
% [m,n]=size(i);
% s=0;
% for x=1:m
%     for y=1:n
%         s=s+i(x,y); %������ֵ�ܺ� s
%     end
% end
% %�������ؾ�ֵ
% a1=mean(mean(i)); %��һ�ַ������ȼ�����������ֵ�������ܾ�ֵ��
% % a2=mean2(i); %�ڶ��ַ������ú���mean2���ܾ�ֵ
% % a3=s/(m*n);  %�����ַ���������ʽ���㣬����ֵ�ܺͳ������ظ�����
% % a4=sum(sum(i))/(m*n); %�����ַ�����Ҳ�ǰ���ʽ���㣬������sum��������ֵ�ܺ͡�

% ������ȡ�߿�λ�ô�С||ͼƬҪ�󣺰߿鴦Ϊ��ɫ������Ϊ�ǰ�ɫ
imgp=imread('C:\Users\weng_lidan\Desktop\ǿ����\ǿ����������3.png');
imgp=rgb2gray(imgp);
p1=(imgp==255);num1=sum(p1(:));%���ص�Ϊ�׵ĵ���
p2=(imgp~=0);num2=sum(p2(:));%���ص�Ϊ�Ǻڵĵ���
num=(num1+num2)/2;%�߿���ռ���ص�

img=imread('C:\Users\weng_lidan\Desktop\ǿ����\ǿ����3��ע��.png');
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