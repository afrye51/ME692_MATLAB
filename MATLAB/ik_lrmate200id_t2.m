function [t2_1, t2_2] = ik_lrmate200id_t2(T_06, t3)

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

c3 = cos(t3);
s3 = sin(t3);
a = -a2-a3*c3+d4*s3;
b = -a3*s3-d4*c3;
c = d1-Pz-bz*d6;
t2_1 = atan2(b, a) + atan2(sqrt(a^2+b^2-c^2), c);
t2_2 = atan2(b, a) - atan2(sqrt(a^2+b^2-c^2), c);

end
