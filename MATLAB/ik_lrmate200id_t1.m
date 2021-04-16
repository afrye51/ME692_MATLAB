function [t1_1, t1_2] = ik_lrmate200id_t1(T_06)

a1 = 0.050;
a2 = 0.330;
a3 = 0.035;
d1 = 0.330;
d4 = -0.335;
d6 = -0.080;

nx = T_06(1, 1);
ny = T_06(2, 1);
nz = T_06(3, 1);

tx = T_06(1, 2);
ty = T_06(2, 2);
tz = T_06(3, 2);

bx = T_06(1, 3);
by = T_06(2, 3);
bz = T_06(3, 3);

Px = T_06(1, 4);
Py = T_06(2, 4);
Pz = T_06(3, 4);

t1_1 = atan2(d6*by + Py, d6*bx + Px);
t1_2 = atan2(-d6*by - Py, -d6*bx - Px); % = t1_1 +- pi

end
