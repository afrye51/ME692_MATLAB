function [dual_theta] = dual_asin(result)

theta = asin(result(1));
d = (result(2)) / cos(theta);
dual_theta = [theta, d];

end