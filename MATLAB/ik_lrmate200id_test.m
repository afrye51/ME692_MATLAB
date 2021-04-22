function [T_ik_error] = ik_lrmate200id_test

theta_min = -pi;
theta_max = pi;

thetas = rand(1, 6) * (theta_max - theta_min) + theta_min;
T_true = fk_partial_lrmate200id(thetas);
x = T_true(1, 4);
y = T_true(2, 4);
z = T_true(3, 4);
euler_ZYX = rotm2eul(T_true(1:3, 1:3));
rx = euler_ZYX(3);
ry = euler_ZYX(2);
rz = euler_ZYX(1);

[t1, t2, t3, t4, t5, t6] = ik_lrmate200id(x, y, z, rx, ry, rz);
T_ik_error = zeros(4, 4, 8);
for i = 1:8
    T_ik_error(:,:,i) = fk_partial_lrmate200id([t1(i), t2(i), t3(i), t4(i), t5(i), t6(i)]) - T_true;
end

end