clear;clc;
A = imread('../images/R_8.JPG');

% �ֱ�����
% ���������ֱ����������������RGB��ֵ(��ɫͼ��̶�Ϊ3)
% �����ǵ������� ^_^
[x,y,z] = size(A);
Number_Left_Top = A(1 : x/6, 1 : y/6, 1 : z);
Shape_Left_Top = A(x/6 : x/2, 1 : y/6, 1 : z);
% ��ȡͼ��
Number_BW = CutImage(Number_Left_Top);
Shape_BW = CutImage(Shape_Left_Top); 
% ��ȡͶӰģ��
Number_Model = GetModel(Number_BW);
Shape_Model = GetModel(Shape_BW);

% ������ɫ
Shape = ParseShape(Shape_Model);
% ��������
Number = ParseNumber(Number_Model);

subplot(2,2,1),imshow(A),title('Դͼ��');
subplot(2,2,2),imshow(Number_BW),title('���Ͻ����ֶ�ֵ��ͼ��');
subplot(2,2,3),imshow(Shape_BW),title('���Ͻǻ�ɫ��ֵ��ͼ��');
subplot(2,2,4),imshow(A),title(strcat(Shape,num2str(Number)));
