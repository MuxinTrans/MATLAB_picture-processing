clc;
clear;

im={}; %�����ֵ䱣���ȡ��ͼƬ
dis=dir('C:\Users\hxd\Desktop\111\*.jpeg');
h = waitbar(0,'Please wait...');
for i=1:length(dis)  
     path=strcat('C:\Users\hxd\Desktop\111\',dis(i).name);
     im{i}=imread(path);%%��ȡͼ�� im�д��ԭͼ�����ݡ�
     A=cutrow(im{i}(:,:,2));
     B=cutcol(im{i}(:,:,2));
     im1{i}=im{i}(A(1):A(2),B(1):B(2),:);
     imwrite(im1{i},strcat('C:\Users\hxd\Desktop\222\',dis(i).name),'jpeg');
     im{i}=1;
     im1{i}=1;
     waitbar(i/length(dis),h);
end

function A=cutrow(I)
%���زü�ʱ������
[m,n]=size(I);     %�õ������������
b=sum(I,2);        %��ÿһ����ͣ��õ�һ��������
b=b';              %��������ת��
z=find(b>=5000);   %�����ֵ�������һ�㣬��������Ҫ���õ�һЩ��,Ѱ�ҷ���Ԫ��
[mm,nn]=size(z);
A=[z(1),z(nn)];    %���Ϻ����µ��к�
end

function B=cutcol(I)
%�������ֱ��ҳ�����ߵı߽磬�����ұߵı߽磨�߽磺����ĳ���Ҷ�ֵ����"�����������ݲ����۲콫�䶨Ϊ20"��
%���زü�ʱ��������
[m,n]=size(I);    %�õ����������������
a=sum(I);         %���н�����ͣ��õ�һ����������
z=find(a>=10000);    %�ҳ����кʹ���10000���б�ŷ���z�У�z��һ��������
[mm,nn]=size(z);  %z�ĳߴ�
B=[z(1),z(nn)];   %�ü���������ҵ��к�
end