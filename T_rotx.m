function [T] = T_rotx(rx)
T = [1      0        0       0; 
     0      cos(rx) -sin(rx) 0; 
     0      sin(rx)  cos(rx) 0; 
     0      0        0       1];
end