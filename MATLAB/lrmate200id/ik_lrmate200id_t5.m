% Description:
% Computes and returns all possible theta 5s

% Parameters:
% T_03 - The transform from the base frame to link 3
% t4 - the theta 4 to use

% Returns:
% t5 - the IK solution
function [t5] = ik_lrmate200id_t5(T_03, t4)

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

t5 = atan2(cos(t4)*bx + sin(t4)*by, -bz);

end
