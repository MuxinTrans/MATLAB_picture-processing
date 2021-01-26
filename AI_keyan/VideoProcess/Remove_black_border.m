%% matlab��Ƶ�ڱ߲ü�
% 1st
%--��Ƶ�������ܺڱ߲ü�--%
clc
clear all
close all
%������Ƶ�ļ����� 
vidObj = VideoWriter('output','MPEG-4');
open(vidObj);
% ԭ��Ƶ��
v = VideoReader('F:\AI\������������\����������\20200913\20200913\ǿ�����߿�\Imag50.avi');   %��ȡ��Ƶ
ori_height = v.Height; ori_width = v.Width; ori_nFrames = v.NumberOfFrames;
f = rgb2gray(read(v,1));     %��ȡ��ɫ��Ƶ֡���ҶȻ�
%ȷ����Χ   ���ұ߽�-----
a = 0; b = 0;
for w = 1:ori_width   
    if(f(ori_height/2,w) > 0)
        a = w;
        break;
    end
end
for w = ori_width:-1:1     
    if(f(ori_height/2,w) > 0)
        b = w;
        break;
    end
end
%ȷ����Χ   ���±߽�-----
c = 0; d = 0;
for h = 1:ori_height   
    if(f(h,ori_width/2) > 0)
        c = h;
        break;
    end
end
for h = ori_height:-1:1     
    if(f(h,ori_width/2) > 0)
        d = h;
        break;
    end
end

%��ȡ��Ƶд����һ��Ƶ�ļ�-----
for n = 1:ori_nFrames
    f = read(v,n);
    writeVideo(vidObj,f(c:d,a:b,:));         %��ȡ��Ƶ֡�Ĳ���д����Ƶ
    clc;
    fprintf('���ȣ�%d / %d \n',n,ori_nFrames);
end
%�ر���Ƶ�ļ�
close(vidObj);

xyloObj = VideoReader('output.mp4'); %��Ӧ�޸�Ϊ��Ҫ��ȡ����Ƶ�ļ�
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