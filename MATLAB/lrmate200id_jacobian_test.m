function [J_err] = lrmate200id_jacobian_test

theta_min = -pi;
theta_max = pi;

thetas = rand(1, 6) * (theta_max - theta_min) + theta_min;
lrmate200id = makeFanuc();
J_true = zeros(6);
J_toolbox = lrmate200id.jacob0(thetas);
J_true(1:3,:) = J_toolbox(4:6,:);
J_true(4:6,:) = J_toolbox(1:3,:);
J_est = lrmate200id_jacobian(J_true, thetas(1), thetas(2), thetas(3), thetas(4), thetas(5), thetas(6));
J_error = double(J_true - J_est)
end
