fun = @jac_det_solve;
% [theta 2, theta 3, theta 4, theta 5]
x0 = [1, 0, 1, 1];
x = fsolve(fun,x0)