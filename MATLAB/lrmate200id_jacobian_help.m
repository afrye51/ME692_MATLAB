% syms c1 s1 c2 s2 c3 s3 c4 s4 c5 s5 c6 s6 a1 a2 a3 d1 d4 d6 nx ny nz bx by bz tx ty tz Px Py Pz
syms t1 t2 t3 t4 t5 t6 a1 a2 a3 d1 d4 d6 real
c1 = cos(t1);
s1 = sin(t1);
c2 = cos(t2);
s2 = sin(t2);
c3 = cos(t3);
s3 = sin(t3);
c4 = cos(t4);
s4 = sin(t4);
c5 = cos(t5);
s5 = sin(t5);
c6 = cos(t6);
s6 = sin(t6);

A_01 = [c1,  0, -s1, a1*c1;
        s1,  0,  c1, a1*s1;
        0,  -1,  0,  d1;
        0,   0,  0,  1];

A_12 = [s2, -c2, 0,  a2*s2;
        -c2,-s2, 0, -a2*c2;
        0,   0,  -1,  0;
        0,   0,  0,  1];

A_23 = [c3,  0, -s3, a3*c3;
        s3,  0,  c3, a3*s3;
        0,  -1,  0,  0;
        0,   0,  0,  1];

A_34 = [c4,  0,  s4, 0;
        s4,  0, -c4, 0;
        0,   1,  0,  d4;
        0,   0,  0,  1];

A_45 = [c5,  0, -s5, 0;
        s5,  0,  c5, 0;
        0,  -1,  0,  0;
        0,   0,  0,  1];

A_56 = [c6,  s6, 0,  0;
        s6, -c6, 0,  0;
        0,   0, -1,  d6;
        0,   0,  0,  1];

A_02 = simplify(A_01 * A_12, 'Steps', 15);
A_03 = simplify(A_02 * A_23, 'Steps', 15);
A_04 = simplify(A_03 * A_34, 'Steps', 15);
A_05 = simplify(A_04 * A_45, 'Steps', 15);
A_06 = simplify(A_05 * A_56, 'Steps', 15);

R_01 = simplify(A_01(1:3, 1:3), 'Steps', 15);
R_02 = simplify(A_02(1:3, 1:3), 'Steps', 15);
R_03 = simplify(A_03(1:3, 1:3), 'Steps', 15);
R_04 = simplify(A_04(1:3, 1:3), 'Steps', 15);
R_05 = simplify(A_05(1:3, 1:3), 'Steps', 15);
R_06 = simplify(A_06(1:3, 1:3), 'Steps', 15);

Z_00 = [ 0;  0;  1];
Z_01 = simplify(R_01 * Z_00, 'Steps', 15);
Z_02 = simplify(R_02 * Z_00, 'Steps', 15);
Z_03 = simplify(R_03 * Z_00, 'Steps', 15);
Z_04 = simplify(R_04 * Z_00, 'Steps', 15);
Z_05 = simplify(R_05 * Z_00, 'Steps', 15);

O_1 = A_01(1:3, 4);
O_2 = A_02(1:3, 4);
O_3 = A_03(1:3, 4);
O_4 = A_04(1:3, 4);
O_5 = A_05(1:3, 4);
O_6 = A_06(1:3, 4);

J = sym(zeros(6));
moment_1 = simplify(cross(Z_00, (O_1 - O_6)), 'Steps', 50);
J(:, 1) = [Z_00; moment_1];
moment_2 = simplify(cross(Z_01, (O_2 - O_6)), 'Steps', 50);
J(:, 2) = [Z_01; moment_2];
moment_3 = simplify(cross(Z_02, (O_3 - O_6)), 'Steps', 50);
J(:, 3) = [Z_02; moment_3];
moment_4 = simplify(cross(Z_03, (O_4 - O_6)), 'Steps', 50);
J(:, 4) = [Z_03; moment_4];
moment_5 = simplify(cross(Z_04, (O_5 - O_6)), 'Steps', 50);
J(:, 5) = [Z_04; moment_5];
moment_6 = 0;
J(:, 6) = [Z_05; moment_1];
J
singularities = simplify(det(J), 'Steps', 100);

a1 = 0.050;
a2 = 0.330;
a3 = 0.035;
d1 = 0.330;
d4 = -0.335;
d6 = -0.080;
subs(singularities)

% t1 = 0;
% t2 = 0;
% t3 = 0;
% t4 = 0;
% t5 = 0;
% t6 = 0;
% a1 = 0.050;
% a2 = 0.330;
% a3 = 0.035;
% d1 = 0.330;
% d4 = -0.335;
% d6 = -0.080;
% 
% subs(Z_00)
% subs(Z_01)
% subs(Z_02)