function [t3_1, t3_2] = ik_lrmate200id_t3(T_06, t1)

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

c1 = cos(t1);
s1 = sin(t1);
L3 = sqrt(a3^2 + d4^2);
t3_add = atan2(a3, -d4);
x = d6*(bx*c1 + by*s1) - a1 + Px*c1 + Py*s1;
y = d1 - Pz - bz*d6;
c3p = (x^2 + y^2 - a2^2 - L3^2) / (-2*a2*L3);
k = acos(c3p);
t3_1 = acos(c3p) - t3_add - pi/2;
t3_2 = -acos(c3p) - t3_add - pi/2;

end
