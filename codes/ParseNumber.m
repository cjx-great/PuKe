function [ output_args ] = ParseNumber( input_args )
%PARSENUMBER �˴���ʾ�йش˺�����ժҪ
% ���ܣ� ��������

% ����ͶӰ30+20ģ��
Model_2 = [0.42045,0.60227,0.72727,0.81818,0.625,  0.5,    0.44318,0.43181,0.40909,0.40909,0.38636,0.27272,0.20454,0.19318,0.22727,0.25,   0.27272,0.27272,0.29545,0.31818,0.31818,0.29545,0.27272,0.26136,0.25,  0.23863,0.23863,0.22727,0.21590,0.66148,0.28571,0.42207,0.5,    0.55194,0.55844,0.44805,0.40909,0.38311,0.36363,0.35064,0.34415,0.34415,0.33766,0.35714,0.36363,0.38311,0.40259,0.56493,0.64935,0.50432];
Model_3 = [0.91666,0.9375, 0.91666,0.6875, 0.41666,0.41666,0.40625,0.41666,0.36458,0.22916,0.22916,0.25,   0.40625,0.53125,0.625,  0.58333,0.35416,0.20833,0.20833,0.1875, 0.19791,0.1875, 0.1875, 0.1875, 0.1875,0.1875, 0.19791,0.22916,0.32291,0.50911,0.33108,0.38513,0.42567,0.39864,0.25675,0.29054,0.32432,0.34459,0.34459,0.35811,0.37162,0.39864,0.42567,0.44594,0.45945,0.47297,0.49324,0.5,    0.52702,0.46756];
Model_4 = [0.22093,0.24418,0.27906,0.31395,0.33720,0.36046,0.39534,0.41860,0.45348,0.45348,0.45348,0.45348,0.43023,0.44186,0.45348,0.44186,0.44186,0.44186,0.44186,0.44186,0.44186,0.44186,0.43023,0.75581,1,     1,      1,      0.61627,0.20930,0.32421,0.12666,0.17333,0.21333,0.26,   0.3    ,0.32666,0.31333,0.32666,0.32,   0.32,   0.32666,0.36,   0.43333,0.43333,0.74666,1,      1,      1,      1,      0.208];
Model_5 = [0.84091,0.86363,0.86363,0.85227,0.21590,0.20454,0.20454,0.20454,0.20454,0.20454,0.32954,0.65909,0.77272,0.82954,0.65909,0.47727,0.38636,0.30681,0.21590,0.20454,0.20454,0.19318,0.18181,0.18181,0.1818,0.18181,0.18181,0.20454,0.20454,0.48863,0.35897,0.60256,0.60897,0.57692,0.53205,0.33974,0.30769,0.3141, 0.30128,0.29487,0.29487,0.30128,0.32051,0.33333,0.35256,0.37179,0.41025,0.50641,0.66025,0.43162];
Model_6 = [0.29787,0.51063,0.61702,0.63829,0.46808,0.40425,0.36171,0.26595,0.19148,0.17021,0.15957,0.17021,0.31914,0.57446,0.71276,0.79787,0.70212,0.57446,0.52127,0.45744,0.43617,0.41489,0.40425,0.39361,0.3829,0.37234,0.3617, 0.37234,0.38297,0.46136,0.33766,0.57792,0.70129,0.77922,0.77922,0.51948,0.42857,0.37662,0.33116,0.2987, 0.29221,0.27922,0.27922,0.2987, 0.32467,0.32467,0.36363,0.3961, 0.50649,0.46031];
Model_7 = [0.95238,1,      1,      0.73809,0.44047,0.44047,0.45238,0.45238,0.30952,0.22619,0.22619,0.21428,0.21428,0.22619,0.21428,0.21428,0.20238,0.19047,0.20238,0.21428,0.20238,0.21428,0.21428,0.21428,0.2142,0.21428,0.21428,0.22619,0.21428,0.20308,0.21333,0.22666,0.22666,0.22666,0.16,   0.15333,0.28,   0.39333,0.48,   0.51333,0.46666,0.44666,0.40666,0.38666,0.36666,0.35333,0.36666,0.31333,0.26666,0.17666];
Model_8 = [0.34693,0.5102, 0.62244,0.59183,0.40816,0.35714,0.31632,0.30612,0.30612,0.28571,0.30612,0.31632,0.33673,0.38775,0.42857,0.62244,0.61224,0.53061,0.5102, 0.61224,0.71428,0.5,    0.41836,0.38775,0.3469,0.33673,0.35714,0.32653,0.32653,0.46079,0.16233,0.36363,0.55194,0.70779,0.66233,0.51948,0.46103,0.42857,0.37012,0.36363,0.33116,0.32467,0.32467,0.32467,0.33766,0.38311,0.3961, 0.45454,0.51948,0.49232];
Model_9 = [0.25531,0.45744,0.57446,0.65957,0.53191,0.46808,0.41489,0.41489,0.38297,0.39361,0.38297,0.38297,0.38297,0.38297,0.38297,0.39361,0.39361,0.42553,0.44681,0.48936,0.51063,0.61702,0.75531,0.79787,0.7127,0.53191,0.2553, 0.18085,0.17021,0.38857,0.20779,0.37662,0.51298,0.61688,0.58441,0.43506,0.38961,0.34415,0.31818,0.30519,0.2987, 0.2987, 0.2987 ,0.31168,0.32467,0.35714,0.38961,0.48701,0.64935,0.61616];
Model_10 =[0.31914,0.59574,0.68085,0.74468,0.65957,0.58511,0.56382,0.55319,0.55319,0.55319,0.55319,0.55319,0.55319,0.55319,0.55319,0.55319,0.55319,0.55319,0.55319,0.55319,0.55319,0.55319,0.55319,0.55319,0.5532,0.55319,0.55319,0.55319,0.55319,0.60471,0.97402,0.98701,0.98701,0.98701,0.48051,0,      0,      0,      0.35714,0.81818,0.8961, 0.94155,0.96753,0.25324,0.21428,0.19481,0.19481,0.22077,0.25324,0.83116];





end
