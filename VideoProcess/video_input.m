close all;
clear all;
clc;

xyloObj = VideoReader('F:\AI\������������\����������\20200913\20200913\ǿ�����߿�\Imag50.avi'); %��Ӧ�޸�Ϊ��Ҫ��ȡ����Ƶ�ļ�

nFrames = xyloObj.NumberOfFrames; %��ȡ��Ƶ��֡��
vidHeight = xyloObj.Height; %��ȡ��Ƶ�߶�
vidWidth = xyloObj.Width; %��ȡ��Ƶ����

for k = 1 : nFrames %����ÿһ֡
    I = read(xyloObj, k); %������ǰ֡
    imshow(I); %��ʾ��ǰ֡
    pause(0.005); %��ͣϵͳ��ʹ��������۲쵽ÿһ֡������Ϊ0.005��
    
    img=rgb2gray(I);
    max=0;min=255;avg=0;
    for i=1:1:vidHeight
        for j=1:1:vidWidth
            if img(i,j)<min
                min=img(i,j);
            end
            if img(i,j)>max
                max=img(i,j);
            end
            avg=avg+double(img(i,j));
        end
    end
    avg=uint8(avg/(vidHeight*vidWidth));
    grayavg(k)=avg;
end