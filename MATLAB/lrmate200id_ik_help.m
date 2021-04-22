% syms c1 s1 c2 s2 c3 s3 c4 s4 c5 s5 c6 s6 a1 a2 a3 d1 d4 d6 nx ny nz bx by bz tx ty tz Px Py Pz
syms t1 t2 t3 t4 t5 t6 a1 a2 a3 d1 d4 d6 nx ny nz bx by bz tx ty tz Px Py Pz
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
% 1, 5, 6
% 6
% 5, 6
% 1, 6

A_01 = [c1,  0, -s1, a1*c1;
        s1,  0,  c1, a1*s1;
        0,  -1,  0,  d1;
        0,   0,  0,  1];

% A_12 = [c2,  s2, 0,  a2*c2;
%         s2, -c2, 0,  a2*s2;
%         0,   0,  -1,  0;
%         0,   0,  0,  1];

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

T_06 = [nx, tx, bx, Px;
        ny, ty, by, Py;
        nz, tz, bz, Pz;
        0,  0,  0,  1];
    

oop = simplify((A_01^-1)*T_06*(A_56^-1)*(A_45^-1), 'Steps', 50);
oop
ip = simplify(A_12*A_23*A_34, 'Steps', 50);
ip