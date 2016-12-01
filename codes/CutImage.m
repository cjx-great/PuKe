function BW = CutImage( Left_Top )
% Left_TopΪ���µ���Ϣ����BWΪ���ص���С��ֵ������
% ����: ��ȡ��С����Ϣ����(���֣���״)

% ͼ���ֵ��,��ɫ
Left_Top_BW = ~im2bw(rgb2gray(Left_Top),0.5);
% ��ֵ�˲�ȥ������������[3,3]Ϊ���ڴ�С
Left_Top_BW = medfilt2(Left_Top_BW,[3,3]);
[L_x,L_y,L_z] = size(Left_Top_BW);
% �Զ����ɫ���ص����,����ͳ�ƣ�ȷ����Ե
WhiteDot = 8;
% �ϱ�Ե
top = 0;
for i=1 : L_x
    count = sum(sum(Left_Top_BW(i : i,:)));
    if count > WhiteDot
        top=i;
        break;
    end
end
% �±�Ե
bottom = 0;
for i=L_x : -1 : 1
    count = sum(sum(Left_Top_BW(i : i,:)));
    if count > WhiteDot
        bottom=i;
        break;
    end
end
% ���Ե
left = 0;
for i=1 : L_y
    count = sum(sum(Left_Top_BW(:,i : i)));
    if count > WhiteDot
        left=i;
        break;
    end
end
% �ұ�Ե
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

