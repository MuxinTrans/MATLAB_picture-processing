function [num] = getnumpoint(imgp)
% 获得斑块所占像素点数
% num 为斑块所占像素点数
% 用来读取斑块位置大小||图片要求：斑块处为白色，其余为非白色
imgp=rgb2gray(imgp);
p1=(imgp==255);num1=sum(p1(:));%像素点为白的点数
p2=(imgp~=0);num2=sum(p2(:));%像素点为非黑的点数
num=(num1+num2)/2;%斑块所占像素点
end

