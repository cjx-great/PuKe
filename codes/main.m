clear;clc;
% 数字投影模板
Model_2 = [0.42045, 0.60227, 0.72727, 0.81818, 0.625, 0.5, 0.44318, 0.43181, 0.40909, 0.40909, 0.38636, 0.27272, 0.20454, 0.19318, 0.22727, 0.25, 0.27272, 0.27272, 0.29545, 0.31818, 0.31818, 0.29545, 0.27272, 0.26136, 0.25, 0.23863, 0.23863, 0.22727, 0.21590, 0.66148, 0.28571, 0.42207, 0.5, 0.55194, 0.55844, 0.44805, 0.40909, 0.38311, 0.36363, 0.35064, 0.34415, 0.34415, 0.33766, 0.35714, 0.36363, 0.38311, 0.40259, 0.56493, 0.64935, 0.50432];
A = imread('../images/B_2.JPG');

% 分辨数字
% 三个参数分别代表：行数，列数，RGB三值(彩色图像固定为3)
% 比例是调出来的 ^_^
[x,y,z] = size(A);
Number_Left_Top = A(1 : x/6, 1 : y/6, 1 : z);
% 图像二值化,反色
Number_BW = ~im2bw(rgb2gray(Number_Left_Top),0.5);
% 中值滤波去除椒盐噪声，[3,3]为窗口大小
Number_BW = medfilt2(Number_BW,[3,3]);
[L_x,L_y,L_z] = size(Number_BW);
% 自定义白色像素点个数,用于统计，确定边缘
WhiteDot = 8;
% 上边缘
top = 0;
for i=1 : L_x
    count = sum(sum(Number_BW(i : i,:)));
    if count > WhiteDot
        top=i;
        break;
    end
end
% 下边缘
bottom = 0;
for i=L_x : -1 : 1
    count = sum(sum(Number_BW(i : i,:)));
    if count > WhiteDot
        bottom=i;
        break;
    end
end
% 左边缘
left = 0;
for i=1 : L_y
    count = sum(sum(Number_BW(:,i : i)));
    if count > WhiteDot
        left=i;
        break;
    end
end
% 右边缘
right = 0;
for i=L_y : -1 : 1
    count = sum(sum(Number_BW(:,i : i)));
    if count > WhiteDot
        right=i;
        break;
    end
end
Number_BW = Number_BW(top : bottom, left : right);
[L_x,L_y,L_z] = size(Number_BW);

Number_Model = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% 对X轴横向投影取30个点
Xdiv_count = 30;
Xdiv = floor(L_x/Xdiv_count);
Xwhite_sum = 0;   % 白色像素点总数
Xdot_sum = 0;   % 像素点总数
x_start = 0;
x_end = 0;
for i=1 : Xdiv_count
    x_start = 1+Xdiv*(i-1);
    if i == Xdiv_count      %最后一个区间
        x_end = L_x;
    else
        x_end = Xdiv*i;
    end
    Xwhite_sum = sum(sum(Number_BW(x_start : x_end,:)));
    Xdot_sum = (x_end - x_start + 1)*L_y;
    Number_Model(i) = Xwhite_sum/Xdot_sum;
end
% 对Y轴纵向投影取20个点
Ydiv_count = 20;
Ydiv = floor(L_y/Ydiv_count);
Ywhite_sum = 0;   % 白色像素点总数
Ydot_sum = 0;   % 像素点总数
y_start = 0;
y_end = 0;
for i=1 : Ydiv_count
    y_start = 1+Ydiv*(i-1);
    if i == Ydiv_count      %最后一个区间
        y_end = L_y;
    else
        y_end = Ydiv*i;
    end
    Ywhite_sum = sum(sum(Number_BW(:,y_start : y_end)));
    Ydot_sum = L_x*(y_end - y_start + 1);
    Number_Model(i+Xdiv_count) = Ywhite_sum/Ydot_sum;
end


subplot(2,2,1),imshow(A),title('源图像');
subplot(2,2,2),imshow(Number_BW),title('左上角数字二值化图像');
