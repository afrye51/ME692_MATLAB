function [t6] = ik_lrmate200id_t6(T_03, t4)

a1 = 0.050;
a2 = 0.330;
a3 = 0.035;
d1 = 0.330;
d4 = -0.335;
d6 = -0.080;

nx = T_03(1, 1);
ny = T_03(2, 1);
nz = T_03(3, 1);

tx = T_03(1, 2);
ty = T_03(2, 2);
tz = T_03(3, 2);

bx = T_03(1, 3);
by = T_03(2, 3);
bz = T_03(3, 3);

Px = T_03(1, 4);
Py = T_03(2, 4);
Pz = T_03(3, 4);

s4 = sin(t4);
c4 = cos(t4);
t6 = atan2(-s4*nx + c4*ny, s4*tx - c4*ty);

end
