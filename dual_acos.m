function [dual_theta] = dual_acos(result)

theta = acos(result(1));
d = (-result(2)) / sin(theta);
dual_theta = [theta, d];

end