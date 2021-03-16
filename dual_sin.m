function [result] = dual_sin(dual_theta)

theta = dual_theta(1);
d = dual_theta(2);
result = [sin(theta), d * cos(theta)];

end