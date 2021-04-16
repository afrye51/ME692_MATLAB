function T = fkpFanuc(theta1,theta2,theta3,theta4,theta5,theta6)

A01 = makeDHmatrix(theta1,-pi/2,0.330,0.050);
A12 = makeDHmatrix(theta2-pi/2,pi,0,0.330);
A23 = makeDHmatrix(theta3,-pi/2,0,0.035);
A34 = makeDHmatrix(theta4,pi/2,-0.335,0);
A45 = makeDHmatrix(theta5,-pi/2,0,0);
A56 = makeDHmatrix(theta6,pi,-0.080,0);

T = A01*A12*A23*A34*A45*A56;
(A01*A12*A23)^-1*T
A34*A45*A56