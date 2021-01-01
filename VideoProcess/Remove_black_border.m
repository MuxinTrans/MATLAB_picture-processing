%% matlab视频黑边裁剪
% 读取带黑边的视频，裁剪黑边并得到新的视频。读取新的视频，显示视频，并读取每帧图像的灰度值，存到相应矩阵。
%--视频画面四周黑边裁剪--%
clc
clear all
close all
%创建视频文件并打开 
vidObj = VideoWriter('output','MPEG-4');
open(vidObj);
% 原视频打开
v = VideoReader('F:\AI\科研资料整理\颈动脉数据\20200913\20200913\强回声斑块\Imag50.avi');   %读取视频
ori_height = v.Height; ori_width = v.Width; ori_nFrames = v.NumberOfFrames;
f = rgb2gray(read(v,1));     %读取彩色视频帧并灰度化
%确定范围   左右边界-----
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
%确定范围   上下边界-----
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

%截取视频写入另一视频文件-----
for n = 1:ori_nFrames
    f = read(v,n);
    writeVideo(vidObj,f(c:d,a:b,:));         %截取视频帧的部分写入视频
    clc;
    fprintf('进度：%d / %d \n',n,ori_nFrames);
end
%关闭视频文件
close(vidObj);

xyloObj = VideoReader('output.mp4'); %相应修改为需要读取的视频文件
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
