clc;clf;clear all;
% =========================================================================
%                      获取手动取点坐标
% =========================================================================
% 读取显示图像
I =  imread('000001.png');
% 转化为双精度型
%I = im2double(I); 
% 若为彩色，转化为灰度
% if(size(I,3)==3), I=rgb2gray(I); end
if ndims(I)==3    I = rgb2gray(I); end
figure(1),imshow(I);

%---------------------------
%      获取Snake的点坐标
%---------------------------
x=[];y=[];c=1;N=100; %定义取点个数c,上限N
% 获取User手动取点的坐标
% [x,y]=getpts
while c<N
    [xi,yi,button]=ginput(1);
    % 获取坐标向量
    x=[x xi];
    y=[y yi];
    hold on
    % text(xi,yi,'o','FontSize',10,'Color','red');
    plot(xi,yi,'ro');
    % 若为右击，则停止循环
    if(button==3), break; end
    c=c+1;
end

% 将第一个点复制到矩阵最后，构成Snake环
xy = [x;y];
c=c+1;
xy(:,c)=xy(:,1);
% 样条曲线差值
t=1:c;
ts = 1:0.1:c;
xys = spline(t,xy,ts);
xs = xys(1,:);
ys = xys(2,:);
% 样条差值效果
hold on
temp=plot(x(1),y(1),'ro',xs,ys,'b.');
legend(temp,'原点','插值点');