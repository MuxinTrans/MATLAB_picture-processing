%读取指定位置的视频，并将得到的视频显示出来，且得到其灰度值。
close all;
clear all;
clc;

xyloObj = VideoReader('F:\AI\科研资料整理\颈动脉数据\20200913\20200913\强回声斑块\Imag50.avi'); %相应修改为需要读取的视频文件

nFrames = xyloObj.NumberOfFrames; %获取视频总帧数
vidHeight = xyloObj.Height; %获取视频高度
vidWidth = xyloObj.Width; %获取视频宽度

for k = 1 : nFrames %遍历每一帧
    I = read(xyloObj, k); %读出当前帧
    imshow(I); %显示当前帧
    pause(0.005); %暂停系统，使人眼连贯观察到每一帧，此设为0.005秒
    
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
