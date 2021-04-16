function [t1, t2, t3, t4, t5, t6] = ik_lrmate200id(x, y, z, rz, ry, rx)

T_06 = T_all(x, y, z, rz, ry, rx);

[t1_1, t1_2] = ik_lrmate200id_t1(T_06);
t1 = [t1_1, t1_1, t1_1, t1_1, t1_2, t1_2, t1_2, t1_2];

[t3_1, t3_2] = ik_lrmate200id_t3(T_06, t1_1);
[t3_3, t3_4] = ik_lrmate200id_t3(T_06, t1_2);
t3 = [t3_1, t3_1, t3_2, t3_2, t3_3, t3_3, t3_4, t3_4];

%[t2_1, t2_2] = ik_lrmate200id_t2(T_06, t3_1);
[t2_3, t2_4] = ik_lrmate200id_t2(T_06, t3_2);
%[t2_5, t2_6] = ik_lrmate200id_t2(T_06, t3_3);
[t2_7, t2_8] = ik_lrmate200id_t2(T_06, t3_4);
%t2 = [t2_1, t2_2, t2_3, t2_4, t2_5, t2_6, t2_7, t2_8];

t4 = 0;
t5 = 0;
t6 = 0;

end
