clc;clf;clear all;
% =========================================================================
%                      ��ȡ�ֶ�ȡ������
% =========================================================================
% ��ȡ��ʾͼ��
I =  imread('000001.png');
% ת��Ϊ˫������
%I = im2double(I); 
% ��Ϊ��ɫ��ת��Ϊ�Ҷ�
% if(size(I,3)==3), I=rgb2gray(I); end
if ndims(I)==3    I = rgb2gray(I); end
figure(1),imshow(I);

%---------------------------
%      ��ȡSnake�ĵ�����
%---------------------------
x=[];y=[];c=1;N=100; %����ȡ�����c,����N
% ��ȡUser�ֶ�ȡ�������
% [x,y]=getpts
while c<N
    [xi,yi,button]=ginput(1);
    % ��ȡ��������
    x=[x xi];
    y=[y yi];
    hold on
    % text(xi,yi,'o','FontSize',10,'Color','red');
    plot(xi,yi,'ro');
    % ��Ϊ�һ�����ֹͣѭ��
    if(button==3), break; end
    c=c+1;
end

% ����һ���㸴�Ƶ�������󣬹���Snake��
xy = [x;y];
c=c+1;
xy(:,c)=xy(:,1);
% �������߲�ֵ
t=1:c;
ts = 1:0.1:c;
xys = spline(t,xy,ts);
xs = xys(1,:);
ys = xys(2,:);
% ������ֵЧ��
hold on
temp=plot(x(1),y(1),'ro',xs,ys,'b.');
legend(temp,'ԭ��','��ֵ��');