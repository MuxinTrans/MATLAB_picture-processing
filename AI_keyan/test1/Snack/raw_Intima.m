 clc
 clear all
 close all
% A=imread('000001.png');     %��ȡ��һ��ͼƬ   
% % thresh = graythresh(A);     %�Զ�ȷ����ֵ����ֵ
% thresh = 30/255;            %ȡֵ��Χ��0~1
% I2 = im2bw(A,thresh);       %��ͼ���ֵ��
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
% figure(1);imshow(A);     %��ʾ��ֵ��֮ǰ��ͼƬ
% figure(2);imshow(I2);    %��ʾ��ֵ��֮���ͼƬ


RGB = imread('000001.png');%��x��xά��
imshow(RGB);
h=imrect;           %�����ʮ�֣�����ѡȡ����Ȥ����,ͼ�оͻ���ֿ����϶��Լ��ı��С�ľ��ο�ѡ��λ�ú�
pos=getPosition(h); %pos���ĸ�ֵ���ֱ��Ǿ��ο�����½ǵ������ x y �� ��� ��Ⱥ͸߶�
RGB = imcrop(RGB, pos);      %����ѡȡͼƬ,pos[���½����꣨x��y��������]
row_start = floor(pos(1,2));     %ROIͼ�����ʼ����
column_start = floor(pos(1,1));  %Ϊ����ROI��������ת����ԭͼ������ֵ׼��
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
bw = imclose(bw,se);  % ������  ��Ӧ�ģ������㣺imopen(bw,se); se����ʾһ��ָ���ĽṹԪ��
bw = imfill(bw,'holes');  % �����
imshow(bw);
[L num]=bwlabel(bw,4); % L:0Ϊ������1Ϊ����1,2Ϊ����2��numΪ������������NΪ4��8��Ĭ�ϣ�����ʾ��ͨ������
s=zeros(num,1);
for i=1:num
    s(i)=sum(sum(L==i)); %����ÿ����ͨ��������
end
[B IX]=sort(s,'descend'); %����Ӵ�С����
 BWout=and(bw,L==IX(1)); %ɾ�����򣨳��������������
% X=0;
% for i=1:3
%     X=or(X,L==IX(i));
% end
%  BWout=and(bw,X); 
[n m] = size(I);%mΪ����nΪ��

% ��ȡѪ�ܱ�Ե��Ϣ
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