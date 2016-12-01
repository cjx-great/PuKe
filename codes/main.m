clear;clc;
A = imread('../images/R_8.JPG');

% 分辨数字
% 三个参数分别代表：行数，列数，RGB三值(彩色图像固定为3)
% 比例是调出来的 ^_^
[x,y,z] = size(A);
Number_Left_Top = A(1 : x/6, 1 : y/6, 1 : z);
Shape_Left_Top = A(x/6 : x/2, 1 : y/6, 1 : z);
% 截取图像
Number_BW = CutImage(Number_Left_Top);
Shape_BW = CutImage(Shape_Left_Top); 
% 获取投影模板
Number_Model = GetModel(Number_BW);
Shape_Model = GetModel(Shape_BW);

% 解析花色
Shape = ParseShape(Shape_Model);
% 解析数字
Number = ParseNumber(Number_Model);

subplot(2,2,1),imshow(A),title('源图像');
subplot(2,2,2),imshow(Number_BW),title('左上角数字二值化图像');
subplot(2,2,3),imshow(Shape_BW),title('左上角花色二值化图像');
subplot(2,2,4),imshow(A),title(strcat(Shape,num2str(Number)));
