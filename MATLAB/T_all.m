function [T] = T_all(x, y, z, rz, ry, rx)

T = eye(4);
T = T * T_rotz(rz);
T = T * T_roty(ry);
T = T * T_rotz(rx);
T = T * T_trans(x, y, z);

end
