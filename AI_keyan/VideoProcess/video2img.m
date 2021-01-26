%%%%%视频切成图像序列
fileName = 'output.mp4'; 
%image_path=
obj = VideoReader(fileName);
numFrames = obj.NumberOfFrames;% 读取视频的帧数CurrentTime
mkdir('frame')
for i = 1 : numFrames
    frame = read(obj,i);% 读取每一帧
    %imshow(frame);%显示每一帧
    namestyle=sprintf('frame/%06d',i);
    imwrite(frame,strcat(namestyle,'.png'),'png');% 保存每一帧
    %imwrite(frame,strcat(num2str(i),'.png'),'png');% 保存每一帧
end
