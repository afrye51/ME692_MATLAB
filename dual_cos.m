function [result] = dual_cos(dual_theta)

theta = dual_theta(1);
d = dual_theta(2);
result = [cos(theta), -d * sin(theta)];

end