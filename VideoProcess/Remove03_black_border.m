clear,clc,close all;
I=imread('C:\\Users\\ASUS\\Desktop\\11.png');
bw=rgb2gray(I);
bw=im2bw(I,graythresh(bw));
% bw2=~bw;
% figure,imshow(bw2)
[f c]=find(bw);%Ѱ�ҳ����з���Ԫ�ص�λ��,f�Ǻ���������,c��������������
img_out=bw(min(f):max(f),min(c):max(c));%��ͼ�����ܵİ׵�ȥ��
figure,imshow(img_out)
% img_out�������ڹ��ɵ�һ�У������һ�У���һ�У����һ��ûȥ������������
% [m,n]=size(img_out);
% img_out=img_out(:,2:n-1);%ȥ����һ�к����һ��