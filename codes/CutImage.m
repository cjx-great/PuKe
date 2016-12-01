function BW = CutImage( Left_Top )
% Left_Top为大致的信息区域，BW为返回的最小二值化区域
% 功能: 截取最小的信息区域(数字，形状)

% 图像二值化,反色
Left_Top_BW = ~im2bw(rgb2gray(Left_Top),0.5);
% 中值滤波去除椒盐噪声，[3,3]为窗口大小
Left_Top_BW = medfilt2(Left_Top_BW,[3,3]);
[L_x,L_y,L_z] = size(Left_Top_BW);
% 自定义白色像素点个数,用于统计，确定边缘
WhiteDot = 8;
% 上边缘
top = 0;
for i=1 : L_x
    count = sum(sum(Left_Top_BW(i : i,:)));
    if count > WhiteDot
        top=i;
        break;
    end
end
% 下边缘
bottom = 0;
for i=L_x : -1 : 1
    count = sum(sum(Left_Top_BW(i : i,:)));
    if count > WhiteDot
        bottom=i;
        break;
    end
end
% 左边缘
left = 0;
for i=1 : L_y
    count = sum(sum(Left_Top_BW(:,i : i)));
    if count > WhiteDot
        left=i;
        break;
    end
end
% 右边缘
right = 0;
for i=L_y : -1 : 1
    count = sum(sum(Left_Top_BW(:,i : i)));
    if count > WhiteDot
        right=i;
        break;
    end
end
BW = Left_Top_BW(top : bottom, left : right);

end

