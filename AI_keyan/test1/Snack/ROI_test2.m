%����ԭͼ��------------------------------------------
img = imread('000001.png');        %��ȡԭͼ��
%ѡȡͼ���ROI����-----------------------------------
figure(1);
imshow(img);title('������ͼ��');                                         %��
h=imrect;           %�����ʮ�֣�����ѡȡ����Ȥ����,ͼ�оͻ���ֿ����϶��Լ��ı��С�ľ��ο�ѡ��λ�ú�
pos=getPosition(h); %pos���ĸ�ֵ���ֱ��Ǿ��ο�����½ǵ������ x y �� ��� ��Ⱥ͸߶�
img_ROI = imcrop(img, pos);      %����ѡȡͼƬ,pos[���½����꣨x��y��������]
figure(2);
imshow(img_ROI);title('�����������ͼ��ROI����');
imwrite(img_ROI,'laser_ROI.png');%����ROIͼ��                             �� 
row_start = floor(pos(1,2));     %ROIͼ�����ʼ����
column_start = floor(pos(1,1));  %Ϊ����ROI��������ת����ԭͼ������ֵ׼��
