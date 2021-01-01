clc;
clear;

im={}; %创建字典保存读取的图片
dis=dir('C:\Users\hxd\Desktop\111\*.jpeg');
h = waitbar(0,'Please wait...');
for i=1:length(dis)  
     path=strcat('C:\Users\hxd\Desktop\111\',dis(i).name);
     im{i}=imread(path);%%读取图像 im中存放原图像数据。
     A=cutrow(im{i}(:,:,2));
     B=cutcol(im{i}(:,:,2));
     im1{i}=im{i}(A(1):A(2),B(1):B(2),:);
     imwrite(im1{i},strcat('C:\Users\hxd\Desktop\222\',dis(i).name),'jpeg');
     im{i}=1;
     im1{i}=1;
     waitbar(i/length(dis),h);
end

function A=cutrow(I)
%返回裁剪时的行数
[m,n]=size(I);     %得到矩阵的行数和
b=sum(I,2);        %对每一行求和，得到一个列向量
b=b';              %对列向量转置
z=find(b>=5000);   %这个阈值可以设大一点，反正都是要被裁掉一些的,寻找非零元素
[mm,nn]=size(z);
A=[z(1),z(nn)];    %最上和最下的行号
end

function B=cutcol(I)
%方法：分别找出最左边的边界，和最右边的边界（边界：大于某个灰度值即可"这里我们依据测量观察将其定为20"）
%返回裁剪时的列数；
[m,n]=size(I);    %得到矩阵的行数和列数
a=sum(I);         %对列进行求和，得到一个行向量；
z=find(a>=10000);    %找出所有和大于10000的列标号放在z中，z是一个行向量
[mm,nn]=size(z);  %z的尺寸
B=[z(1),z(nn)];   %裁剪最左和最右的列号
end