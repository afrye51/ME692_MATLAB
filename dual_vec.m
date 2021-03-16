function [S] = dual_vec(s, r)

s = s / norm(s);
S = [s; cross(r, s)];

end