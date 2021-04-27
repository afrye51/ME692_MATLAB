function fanuc = makeFanuc

L1 = Revolute('d', 0.330, 'a', 0.050, 'alpha', -pi/2);
L2 = Revolute('d', 0, 'a', 0.330, 'alpha', pi, 'offset', -pi/2);
L3 = Revolute('d', 0, 'a', 0.035, 'alpha', -pi/2);
L4 = Revolute('d', -0.335, 'a', 0, 'alpha', pi/2);
L5 = Revolute('d', 0, 'a', 0, 'alpha', -pi/2);
L6 = Revolute('d', -0.080, 'a', 0, 'alpha', pi);

fanuc=SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'fanuc');