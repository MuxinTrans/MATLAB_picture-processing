%输入原图像------------------------------------------
img = imread('000001.png');        %读取原图像
%选取图像的ROI区域-----------------------------------
figure(1);
imshow(img);title('待处理图像');                                         %①
h=imrect;           %鼠标变成十字，用来选取感兴趣区域,图中就会出现可以拖动以及改变大小的矩形框，选好位置后
pos=getPosition(h); %pos有四个值，分别是矩形框的左下角点的坐标 x y 和 框的 宽度和高度
img_ROI = imcrop(img, pos);      %拷贝选取图片,pos[左下角坐标（x，y），宽，高]
figure(2);
imshow(img_ROI);title('激光光条区域（图像ROI区域）');
imwrite(img_ROI,'laser_ROI.png');%保存ROI图像                             ② 
row_start = floor(pos(1,2));     %ROI图像的起始行列
column_start = floor(pos(1,1));  %为后面ROI区域坐标转换回原图像坐标值准备
