% Description:
% Computes and returns all 8 possible inverse kinematics solutions for the
% lrmate200id robot

% Parameters:
% x - end effector x translation in the global frame
% y - end effector y translation in the global frame
% z - end effector z translation in the global frame
% rz - end effector z rotation in the global frame
% ry - end effector y rotation in the global frame
% rx - end effector x rotation in the global frame

% Returns:
% t1 ... t6 - an 8-element array of each IK solution for the respective
%   angle
function [t1, t2, t3, t4, t5, t6] = ik_lrmate200id(x, y, z, rx, ry, rz)

T_06 = T_all(x, y, z, rz, ry, rx);

[t1_1, t1_2] = ik_lrmate200id_t1(T_06);
t1 = [t1_1, t1_1, t1_1, t1_1, t1_2, t1_2, t1_2, t1_2];

[t3_1, t3_2] = ik_lrmate200id_t3(T_06, t1_1);
[t3_3, t3_4] = ik_lrmate200id_t3(T_06, t1_2);
t3 = [t3_1, t3_1, t3_2, t3_2, t3_3, t3_3, t3_4, t3_4];

t2_1 = ik_lrmate200id_t2(T_06, t1_1, t3_1);
t2_2 = ik_lrmate200id_t2(T_06, t1_1, t3_2);
t2_3 = ik_lrmate200id_t2(T_06, t1_2, t3_3);
t2_4 = ik_lrmate200id_t2(T_06, t1_2, t3_4);
t2 = [t2_1, t2_1, t2_2, t2_2, t2_3, t2_3, t2_4, t2_4];

T_36_1 = fk_partial_lrmate200id([t1_1, t2_1, t3_1])^-1 * T_06;
T_36_2 = fk_partial_lrmate200id([t1_1, t2_2, t3_2])^-1 * T_06;
T_36_3 = fk_partial_lrmate200id([t1_2, t2_3, t3_3])^-1 * T_06;
T_36_4 = fk_partial_lrmate200id([t1_2, t2_4, t3_4])^-1 * T_06;
T_03 = cat(3, T_36_1, T_36_1, T_36_2, T_36_2, T_36_3, T_36_3, T_36_4, T_36_4);

[t4_1, t4_2] = ik_lrmate200id_t4(T_36_1);
[t4_3, t4_4] = ik_lrmate200id_t4(T_36_2);
[t4_5, t4_6] = ik_lrmate200id_t4(T_36_3);
[t4_7, t4_8] = ik_lrmate200id_t4(T_36_4);
t4 = [t4_1, t4_2, t4_3, t4_4, t4_5, t4_6, t4_7, t4_8];

t5 = zeros(1, 8);
t6 = zeros(1, 8);
for i = 1:8
    [t5(i)] = ik_lrmate200id_t5(T_03(:,:,i), t4(i));
    [t6(i)] = ik_lrmate200id_t6(T_03(:,:,i), t4(i));
end

end
