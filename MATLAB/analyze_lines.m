function [dot_prod, cross_prod, dual_angle] = analyze_lines(S, L)

S_mag = norm(S(1:3));
L_mag = norm(L(1:3));
S = S / S_mag;
L = L / L_mag;
mag = S_mag * L_mag;

s = S(1:3);
pxs = S(4:6);
w = L(1:3);
rxw = L(4:6);

% PI_mat = [0*eye(3), eye(3); eye(3), 0*eye(3)];
% dot_prod = [s'*w, S'*PI_mat*L] * mag;
dot_prod = [s'*w, s'*rxw + pxs'*w] * mag;
dual_angle = dual_acos(dot_prod / mag);

sxw = cross(s, w)
sxrxw = cross(s, rxw)
pxsxw = cross(pxs, w)
stheta = dual_sin(dual_angle)

theta = dual_angle(1)
cross_prod = [cross(s, w); cross(s, rxw) + cross(pxs, w)] * mag;
d = dual_angle(2)
n = cross_prod(1:3) / sin(theta)
pxn = (cross_prod(4:6) - n*d*cos(theta)) / sin(theta)
N = [n; pxn]
ndctheta = n*d*cos(theta)
sthetan = sin(theta)*n
pxsthetan = pxn*sin(theta)

sxpxw = cross(-pxs, w)
sxdnxw = cross(s, cross(d*n, w))
sb_sxrxw = sxpxw + sxdnxw
ykwti = sxpxw + sxdnxw + pxsthetan
other = sxrxw + pxsthetan
sthetaN = [sin(theta)*n; n*d*cos(theta)+pxn*sin(theta)]


end