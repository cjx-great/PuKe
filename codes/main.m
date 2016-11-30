clear;clc;
% ����ͶӰģ��
Model_2 = [0.42045, 0.60227, 0.72727, 0.81818, 0.625, 0.5, 0.44318, 0.43181, 0.40909, 0.40909, 0.38636, 0.27272, 0.20454, 0.19318, 0.22727, 0.25, 0.27272, 0.27272, 0.29545, 0.31818, 0.31818, 0.29545, 0.27272, 0.26136, 0.25, 0.23863, 0.23863, 0.22727, 0.21590, 0.66148, 0.28571, 0.42207, 0.5, 0.55194, 0.55844, 0.44805, 0.40909, 0.38311, 0.36363, 0.35064, 0.34415, 0.34415, 0.33766, 0.35714, 0.36363, 0.38311, 0.40259, 0.56493, 0.64935, 0.50432];
A = imread('../images/B_2.JPG');

% �ֱ�����
% ���������ֱ������������������RGB��ֵ(��ɫͼ��̶�Ϊ3)
% �����ǵ������� ^_^
[x,y,z] = size(A);
Number_Left_Top = A(1 : x/6, 1 : y/6, 1 : z);
% ͼ���ֵ��,��ɫ
Number_BW = ~im2bw(rgb2gray(Number_Left_Top),0.5);
% ��ֵ�˲�ȥ������������[3,3]Ϊ���ڴ�С
Number_BW = medfilt2(Number_BW,[3,3]);
[L_x,L_y,L_z] = size(Number_BW);
% �Զ����ɫ���ص����,����ͳ�ƣ�ȷ����Ե
WhiteDot = 8;
% �ϱ�Ե
top = 0;
for i=1 : L_x
    count = sum(sum(Number_BW(i : i,:)));
    if count > WhiteDot
        top=i;
        break;
    end
end
% �±�Ե
bottom = 0;
for i=L_x : -1 : 1
    count = sum(sum(Number_BW(i : i,:)));
    if count > WhiteDot
        bottom=i;
        break;
    end
end
% ���Ե
left = 0;
for i=1 : L_y
    count = sum(sum(Number_BW(:,i : i)));
    if count > WhiteDot
        left=i;
        break;
    end
end
% �ұ�Ե
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
% ��X�����ͶӰȡ30����
Xdiv_count = 30;
Xdiv = floor(L_x/Xdiv_count);
Xwhite_sum = 0;   % ��ɫ���ص�����
Xdot_sum = 0;   % ���ص�����
x_start = 0;
x_end = 0;
for i=1 : Xdiv_count
    x_start = 1+Xdiv*(i-1);
    if i == Xdiv_count      %���һ������
        x_end = L_x;
    else
        x_end = Xdiv*i;
    end
    Xwhite_sum = sum(sum(Number_BW(x_start : x_end,:)));
    Xdot_sum = (x_end - x_start + 1)*L_y;
    Number_Model(i) = Xwhite_sum/Xdot_sum;
end
% ��Y������ͶӰȡ20����
Ydiv_count = 20;
Ydiv = floor(L_y/Ydiv_count);
Ywhite_sum = 0;   % ��ɫ���ص�����
Ydot_sum = 0;   % ���ص�����
y_start = 0;
y_end = 0;
for i=1 : Ydiv_count
    y_start = 1+Ydiv*(i-1);
    if i == Ydiv_count      %���һ������
        y_end = L_y;
    else
        y_end = Ydiv*i;
    end
    Ywhite_sum = sum(sum(Number_BW(:,y_start : y_end)));
    Ydot_sum = L_x*(y_end - y_start + 1);
    Number_Model(i+Xdiv_count) = Ywhite_sum/Ydot_sum;
end


subplot(2,2,1),imshow(A),title('Դͼ��');
subplot(2,2,2),imshow(Number_BW),title('���Ͻ����ֶ�ֵ��ͼ��');