function [J] = lrmate200id_jacobian(J_true, t1, t2, t3, t4, t5, t6)

a1 = 0.050;
a2 = 0.330;
a3 = 0.035;
d1 = 0.330;
d4 = -0.335;
d6 = -0.080;

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

A_02 = A_01 * A_12;
A_03 = A_02 * A_23;
A_04 = A_03 * A_34;
A_05 = A_04 * A_45;
A_06 = A_05 * A_56;

R_01 = A_01(1:3, 1:3);
R_02 = A_02(1:3, 1:3);
R_03 = A_03(1:3, 1:3);
R_04 = A_04(1:3, 1:3);
R_05 = A_05(1:3, 1:3);
R_06 = A_06(1:3, 1:3);

Z_00 = [ 0;  0;  1];
Z_01 = R_01 * Z_00;
Z_02 = R_02 * Z_00;
Z_03 = R_03 * Z_00;
Z_04 = R_04 * Z_00;
Z_05 = R_05 * Z_00;

O_1 = A_01(1:3, 4);
O_2 = A_02(1:3, 4);
O_3 = A_03(1:3, 4);
O_4 = A_04(1:3, 4);
O_5 = A_05(1:3, 4);
O_6 = A_06(1:3, 4);

O_61 = O_6 - O_1;
O_62 = O_6 - O_2;
O_63 = O_6 - O_3;
O_64 = O_6 - O_4;
O_65 = O_6 - O_5;

c01 = cross(Z_00, O_61);
c02 = cross(Z_00, O_62);
c03 = cross(Z_00, O_63);
c04 = cross(Z_00, O_64);
c05 = cross(Z_00, O_65);
c11 = cross(Z_01, O_61);
c12 = cross(Z_01, O_62);
c13 = cross(Z_01, O_63);
c14 = cross(Z_01, O_64);
c15 = cross(Z_01, O_65);
c21 = cross(Z_02, O_61);
c22 = cross(Z_02, O_62);
c23 = cross(Z_02, O_63);
c24 = cross(Z_02, O_64);
c25 = cross(Z_02, O_65);
c31 = cross(Z_03, O_61);
c32 = cross(Z_03, O_62);
c33 = cross(Z_03, O_63);
c34 = cross(Z_03, O_64);
c35 = cross(Z_03, O_65);
c41 = cross(Z_04, O_61);
c42 = cross(Z_04, O_62);
c43 = cross(Z_04, O_63);
c44 = cross(Z_04, O_64);
c45 = cross(Z_04, O_65);
c51 = cross(Z_05, O_61);
c52 = cross(Z_05, O_62);
c53 = cross(Z_05, O_63);
c54 = cross(Z_05, O_64);
c55 = cross(Z_05, O_65);

J = zeros(6);
moment_1 = cross(Z_00, (O_6));
J(:, 1) = [Z_00; moment_1];
moment_2 = cross(Z_01, (O_6 - O_1));
J(:, 2) = [Z_01; moment_2];
moment_3 = cross(Z_02, (O_6 - O_2));
J(:, 3) = [Z_02; moment_3];
moment_4 = cross(Z_03, (O_6 - O_3));
J(:, 4) = [Z_03; moment_4];
moment_5 = cross(Z_04, (O_6 - O_4));
J(:, 5) = [Z_04; moment_5];
moment_6 = cross(Z_05, (O_6 - O_5));%[0; 0; 0];
J(:, 6) = [Z_05; moment_6];

end
