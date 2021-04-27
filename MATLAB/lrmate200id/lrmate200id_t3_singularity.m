% Description:
% Computes and returns theta 3 that causes a shoulder singularity with the
%   given theta 2

% Parameters:
% t2 - Theta 2 at which to compute t3

% Returns:
% t3 - the two theta 3 solutions which cause a shoulder singularity
function [t3] = lrmate200id_t3_singularity(t2)

a1 = 0.050;
a2 = 0.330;
a3 = 0.035;
d1 = 0.330;
d4 = -0.335;
d6 = -0.080;

b = ((a3^2 + d4^2)*cos(t2)^2 + (a3^2 + d4^2 - a2^2)*sin(t2)^2 - a1^2 - 2*a1*a2*sin(t2))^(1/2);
c = a1 + d4*cos(t2) + a2*sin(t2) - a3*sin(t2);
a = a3*cos(t2) + d4*sin(t2);

t3 = zeros(1, 2);
t3(1) = 2*atan((a + b) / c);
t3(2) = 2*atan((a - b) / c);

end
