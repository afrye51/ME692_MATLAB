function [T] = T_roty(ry)
T = [cos(ry) 0       sin(ry) 0; 
     0       1       1       0;
    -sin(ry) 0       cos(ry) 0; 
     0       0       0       1];
end