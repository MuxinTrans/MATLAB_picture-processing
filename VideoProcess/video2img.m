%%%%%��Ƶ�г�ͼ������
fileName = 'output.mp4'; 
%image_path=
obj = VideoReader(fileName);
numFrames = obj.NumberOfFrames;% ��ȡ��Ƶ��֡��CurrentTime
mkdir('frame')
for i = 1 : numFrames
    frame = read(obj,i);% ��ȡÿһ֡
    %imshow(frame);%��ʾÿһ֡
    namestyle=sprintf('frame/%06d',i);
    imwrite(frame,strcat(namestyle,'.png'),'png');% ����ÿһ֡
    %imwrite(frame,strcat(num2str(i),'.png'),'png');% ����ÿһ֡
end
