function Shape = ParseShape( Shape_Model )
%PARSESHAPE 此处显示有关此函数的摘要
% 功能: 解析花色

% 花色投影30+20模板 R--红桃 B--黑桃 F--方片 M--梅花
Model_R = [0.2439, 0.4878, 0.60975,0.70731,0.78048,0.82926,0.85365,0.90243,0.92682,0.97561,1,      1,      1,      1,      1,      1,      1,      0.97561,0.95121,0.92682,0.90243,0.90243,0.85365,0.82926,0.80487,0.78048,0.75609,0.68292,0.68292,0.44947,0.25581,0.44186,0.56976,0.66279,0.76744,0.83721,0.89534,0.96511,0.94186,0.83721,0.77906,0.88372,0.93023,0.89534,0.84883,0.77906,0.7093, 0.60465,0.51162,0.33333];
Model_B = [0.23684,0.26315,0.31578,0.34211,0.36842,0.42105,0.44736,0.47368,0.52631,0.57894,0.63157,0.65789,0.68421,0.73684,0.76315,0.78947,0.84211,0.86842,0.89473,0.94736,0.94736,0.97368,1,      1,      1,      1,      1,      1,      1,      0.44078,0.22222,0.31111,0.35555,0.42222,0.46666,0.51111,0.53333,0.57777,0.6,    0.62222,0.64444,0.68888,0.68888,0.71111,0.73333,0.77777,0.8,    1,      1,      0.61988];
Model_F = [0.3,    0.36666,0.36666,0.43333,0.5,    0.5,    0.56666,0.63333,0.7,    0.73333,0.76666,0.83333,0.9,    0.96666,1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      0.96666,0.9,    0.83333,0.76666,0.7,    0.47037,0.26315,0.31578,0.36842,0.42105,0.47368,0.55263,0.63157,0.68421,0.76315,0.81578,0.94736,1,      1,      1,      1,      1,      1,      1,      1,      0.64114];
Model_M = [0.24444,0.28888,0.33333,0.37777,0.4,    0.44444,0.46666,0.46666,0.46666,0.48888,0.48888,0.46666,0.46666,0.46666,0.46666,0.42222,0.37777,0.37777,0.33333,0.66666,0.77777,0.86666,0.91111,0.95555,0.95555,1,      1,      1,      1,      0.51746,0.23,   0.3,    0.38,   0.42,   0.42,   0.44,   0.64,   0.71,   0.74,   0.8,    0.96,   1,      0.85,   0.77,   0.7,    0.66,   0.51,   0.42,   0.42,   0.32571];

Model = [Model_R;Model_B;Model_F;Model_M];
% 存储矩阵间的相关系数
correlation = [0,0,0,0];
for i=1 : 4
    rel = corrcoef(Model(i,:),Shape_Model);
    correlation(i) = abs(rel(2));
end

d = dist(1,correlation);
[min_dist,index] = min(d);
switch index
    case 1
        Shape = '红桃';
    case 2
        Shape = '黑桃';
    case 3
        Shape = '方片';
    case 4
        Shape = '梅花';
end
end

