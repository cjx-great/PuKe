function Model = GetModel( BW )
% BW为二值图像，Model为图像的投影模板
% 功能: 获取图像的投影模板

% 30+20模板
Model = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

[L_x,L_y,L_z] = size(BW);
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
    Xwhite_sum = sum(sum(BW(x_start : x_end,:)));
    Xdot_sum = (x_end - x_start + 1)*L_y;
    Model(i) = Xwhite_sum/Xdot_sum;
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
    Ywhite_sum = sum(sum(BW(:,y_start : y_end)));
    Ydot_sum = L_x*(y_end - y_start + 1);
    Model(i+Xdiv_count) = Ywhite_sum/Ydot_sum;
end


end

