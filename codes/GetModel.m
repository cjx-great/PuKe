function Model = GetModel( BW )
% BWΪ��ֵͼ��ModelΪͼ���ͶӰģ��
% ����: ��ȡͼ���ͶӰģ��

% 30+20ģ��
Model = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

[L_x,L_y,L_z] = size(BW);
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
    Xwhite_sum = sum(sum(BW(x_start : x_end,:)));
    Xdot_sum = (x_end - x_start + 1)*L_y;
    Model(i) = Xwhite_sum/Xdot_sum;
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
    Ywhite_sum = sum(sum(BW(:,y_start : y_end)));
    Ydot_sum = L_x*(y_end - y_start + 1);
    Model(i+Xdiv_count) = Ywhite_sum/Ydot_sum;
end


end

