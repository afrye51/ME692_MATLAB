% Description:
% Computes and returns all possible theta 2s

% Parameters:
% T_06 - The end effector transform
% t1 - the theta 1 to use
% t3 - the theta 3 to use

% Returns:
% t2 - the IK solution
function [t2] = ik_lrmate200id_t2(T_06, t1, t3)

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
a = a2;
b = sqrt(a3^2 + d4^2);
t3_add = atan2(a3, -d4);
gamma = pi/2 + t3_add + t3;
c = sqrt(a^2 + b^2 - 2*a*b*cos(gamma));
x = d6*(bx*c1 + by*s1) - a1 + Px*c1 + Py*s1;
y = d1 - Pz - bz*d6;
t2p = atan2(y, x);

cos_beta = (b^2 - a^2 - c^2) / (-2*a*c);
sin_beta = b / c * sin(gamma);
beta = atan2(sin_beta, cos_beta);

t2 = pi/2 - (beta - t2p);

end
