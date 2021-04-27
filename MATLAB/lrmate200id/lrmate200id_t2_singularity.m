% Description:
% Computes and returns theta 2 that causes a shoulder singularity with the
%   given theta 3

% Parameters:
% t3 - Theta 3 at which to compute t2

% Returns:
% t2 - the two theta 2 solutions which cause a shoulder singularity
function [t2] = lrmate200id_t2_singularity(t3)

a1 = 0.050;
a2 = 0.330;
a3 = 0.035;
d1 = 0.330;
d4 = -0.335;
d6 = -0.080;

c3 = cos(t3);
s3 = sin(t3);
c23 = cos(2*t3);
s23 = sin(2*t3);

a = -(d4^2+a3^2)/2 + (a3^2-d4^2)*c23/2 - a3*d4*s23;
b = (a3^2-d4^2)/2*s23 + a3*d4*c23 + a2*d4*c3 + a2*a3*s3;
c = -a1*a3*s3 - a1*d4*c3;
sqr = sqrt(a^2 + b^2 - c^2);

t2 = zeros(1, 2);
try
    t2(1) = atan2(b, a) + atan2(sqr, c);
    t2(2) = atan2(b, a) - atan2(sqr, c);
end

end
