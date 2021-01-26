 clc
 clear all
 close all
% A=imread('000001.png');     %读取到一张图片   
% % thresh = graythresh(A);     %自动确定二值化阈值
% thresh = 30/255;            %取值范围：0~1
% I2 = im2bw(A,thresh);       %对图像二值化
% % [w,h]=size(A);
% % for m=1:w
% %     for n=1:h
% %         if A(m,n)>30
% %             I2(m,n)=255;
% %         else
% %             I2(m,n)=0;
% %         end
% %     end
% % end
% 
% figure(1);imshow(A);     %显示二值化之前的图片
% figure(2);imshow(I2);    %显示二值化之后的图片


RGB = imread('000001.png');%宽x长x维度
imshow(RGB);
h=imrect;           %鼠标变成十字，用来选取感兴趣区域,图中就会出现可以拖动以及改变大小的矩形框，选好位置后
pos=getPosition(h); %pos有四个值，分别是矩形框的左下角点的坐标 x y 和 框的 宽度和高度
RGB = imcrop(RGB, pos);      %拷贝选取图片,pos[左下角坐标（x，y），宽，高]
row_start = floor(pos(1,2));     %ROI图像的起始行列
column_start = floor(pos(1,1));  %为后面ROI区域坐标转换回原图像坐标值准备
figure(2);subplot(4,1,1)
imshow(RGB);
hold on
I = rgb2gray(RGB);
bw = im2bw(I,30/255);
subplot(4,1,2);
imshow(bw)
bw = bwareaopen(bw,10);  
se = strel('disk',2);
subplot(4,1,3);
bw = imclose(bw,se);  % 闭运算  相应的，开运算：imopen(bw,se); se即表示一种指定的结构元。
bw = imfill(bw,'holes');  % 填洞操作
imshow(bw);
[L num]=bwlabel(bw,4); % L:0为背景，1为对象1,2为对象2；num为对象总数量；N为4或8（默认），表示连通数量。
s=zeros(num,1);
for i=1:num
    s(i)=sum(sum(L==i)); %计算每个连通区域的面积
end
[B IX]=sort(s,'descend'); %面积从大到小排序
 BWout=and(bw,L==IX(1)); %删除区域（除了面积最大的区域）
% X=0;
% for i=1:3
%     X=or(X,L==IX(i));
% end
%  BWout=and(bw,X); 
[n m] = size(I);%m为长，n为宽

% 获取血管边缘信息
Enum_1=0;
for je = 1:5:m
    for ie = 1:n
        if(BWout(ie,je)~=0)
            Enum_1((je+4)/5)=ie;
            break;
        end
    end
end

for ii = 1:n
    for jj = 1:m
        if(BWout(ii,jj)==0)
            RGB(ii,jj,1)=0;
            RGB(ii,jj,2)=0;
            RGB(ii,jj,3)=0;
        end
    end
end
subplot(4,1,4);
imshow(RGB);
hold on
Ex_1=1:5:m;
plot(Ex_1,Enum_1);
hold off