function [T] = T_rotz(rz)
T = [cos(rz) -sin(rz) 0      0; 
     sin(rz)  cos(rz) 0      0; 
     0        0       1      0;
     0        0       0      1];
end