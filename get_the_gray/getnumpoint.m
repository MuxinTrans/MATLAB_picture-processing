function [num] = getnumpoint(imgp)
% ��ð߿���ռ���ص���
% num Ϊ�߿���ռ���ص���
% ������ȡ�߿�λ�ô�С||ͼƬҪ�󣺰߿鴦Ϊ��ɫ������Ϊ�ǰ�ɫ
imgp=rgb2gray(imgp);
p1=(imgp==255);num1=sum(p1(:));%���ص�Ϊ�׵ĵ���
p2=(imgp~=0);num2=sum(p2(:));%���ص�Ϊ�Ǻڵĵ���
num=(num1+num2)/2;%�߿���ռ���ص�
end

