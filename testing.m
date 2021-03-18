clear all
d1 = [0; 1; 0];
p1 = [1; 2; 3];
l1 = dual_vec(d1, p1);
d2 = [1; 4; 5];
p2 = [-1; 4; 12];
l2 = dual_vec(d2, p2);

S = l1;
L = l2;

S_mag = norm(S(1:3));
L_mag = norm(L(1:3));
S = S / S_mag;
L = L / L_mag;
mag = S_mag * L_mag;

s = S(1:3);
p = [1;-2.615384615384615;3];
c = p1;
pxs = S(4:6);
w = L(1:3);
q = p2;
rxw = L(4:6);

% PI_mat = [0*eye(3), eye(3); eye(3), 0*eye(3)];
% dot_prod = [s'*w, S'*PI_mat*L] * mag;
dot_prod = [s'*w, s'*rxw + pxs'*w] * mag;
dual_angle = dual_acos(dot_prod / mag);
cross_prod = [cross(s, w); cross(s, rxw) + cross(pxs, w)] * mag;

sxw = cross(s, w);
sxrxw = cross(s, rxw);
pxsxw = cross(pxs, w);
stheta = dual_sin(dual_angle);

theta = dual_angle(1);
d = dual_angle(2);
sb_n = cross(s, w) / sin(theta);
n = cross_prod(1:3) / sin(theta);
r = p + n*d;
sb_rxn = cross(r, n);
pxn = (cross_prod(4:6) - n*d*cos(theta)) / sin(theta);
N = [n; pxn];

sb_cross_prod = [sin(theta)*n; n*d*cos(theta) + cross(p, sin(theta)*n)];
sb_cross_prod2 = [cross(s, w); cross(s, cross(r, w)) + cross(cross(p, s), w)];
sb_cross_prod3 = [cross(s, w); cross(s, cross(p, w)) + cross(s, cross(d*n, w)) + cross(cross(p, s), w)];
res_1_true = sin(theta)*n;
res_1_test = cross(s, w);

res_2_true = cross(p, sin(theta)*n);
res_2_test = cross(cross(p, s), w);

res_3_true = cross(s, cross(r, w));
res_3_test = cross(s, cross(p, w)) + cross(s, cross(d*n, w));

res_4_true = cos(theta)*d*n;
res_4_test = cross(s, cross(d*n, w));

res_5_true = cross(p, sin(theta)*n);
res_5_test = cross(s, cross(p, w)) + cross(cross(p, s), w);

% N2 = [n; sb_pxn];
% N3 = [n; sb_rxn];
% sb_cross_prod = dual_mult(dual_sin(dual_angle), N);
% sb_cross_prod2 = dual_mult(dual_sin(dual_angle), N2);
% sb_cross_prod3 = dual_mult(dual_sin(dual_angle), N3);
% res_ndctheta = n*d*cos(theta);
% res_sthetan = sin(theta)*n;
% res_pxsthetan = pxn*sin(theta);
% 
% sx_pxw = cross(s, cross(p, w));
% pxs_xw = cross(cross(p, s), w);
% sx_dnxw = cross(s, cross(d*n, w));
% sx_rxw = cross(s, cross(r, w));
% sb_sx_rxw = sx_pxw + sx_dnxw;
% sb_sx_rxw_3 = sx_pxw + sx_dnxw;
% sb_sx_rxw_4 = sx_pxw + sx_dnxw;
% sb_sx_rxw_5 = sx_pxw + sx_dnxw;
% sb_pxsthetan = sx_pxw + pxs_xw;
% sb_r = p + d*n;
% 
% 
% sb_result_dual = sx_pxw + sx_dnxw + pxs_xw;
% sb_result_dual_2 = sx_rxw + pxs_xw;
% sb_result_dual_3 = n*d*cos(theta) + cross(p, n)*sin(theta);
% sb_result_dual_4 = n*d*cos(theta) + pxn*sin(theta);
% sb_result_real = sin(theta)*n;