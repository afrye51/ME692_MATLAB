import numpy as np
import matplotlib.pyplot as plt


def dh_transform(theta, d, a, alpha):
    ct = np.cos(theta)
    st = np.sin(theta)
    ca = np.cos(alpha)
    sa = np.sin(alpha)
    T = [[ct, -st*ca,  st*sa, a*ct],
         [st,  ct*ca, -ct*sa, a*st],
         [0,   sa,     ca,    d],
         [0,   0,      0,     1]]
    return np.array(T)


# Forward kinematics with all angles as positive [x, -y, z]
# def fkpGP12_all_pos_angles(t1, t2, t3, t4, t5, t6):
#     T = np.eye(4)
#     T = T.dot(dh_transform(t1, 0.450, 0.155, np.pi/2))
#     T = T.dot(dh_transform(t2+np.pi/2, 0, 0.614, 0))
#     T = T.dot(dh_transform(t3, 0, 0.200, np.pi/2))
#     T = T.dot(dh_transform(t4, 0.640, 0, -np.pi/2))
#     T = T.dot(dh_transform(t5, 0, 0, np.pi/2))
#     T = T.dot(dh_transform(t6, 0.100, 0, 0))
#     return T


# Forward kinematics with angle directions as described in all materials
def fkpGP12(t1, t2, t3, t4, t5, t6):
    T = np.eye(4)
    T = T.dot(dh_transform(t1, 0.450, 0.155, -np.pi/2))
    T = T.dot(dh_transform(t2-np.pi/2, 0, 0.614, np.pi))
    T = T.dot(dh_transform(t3, 0, 0.200, -np.pi/2))
    T = T.dot(dh_transform(t4, -0.640, 0, np.pi/2))
    T = T.dot(dh_transform(t5, 0, 0, -np.pi/2))
    T = T.dot(dh_transform(t6, -0.100, 0, np.pi))
    return T


base = [0, 0, 0]

print('Testing all zeros')
print('Should be: ' + str([0.895, 0, 0.814+0.450]))
T_0 = fkpGP12(0, 0, 0, 0, 0, 0)
end_effector = T_0.dot(np.array(base+[1]).T)[0:3]
print(end_effector)
print()

print('Testing 90 degree turning rotation')
print('Should be: ' + str([0, 0.895, 0.814+0.450]))
T_0 = fkpGP12(np.pi/2, 0, 0, 0, 0, 0)
end_effector = T_0.dot(np.array(base+[1]).T)[0:3]
print(end_effector)
print()

print('Testing 90 degree lower arm rotation')
print('Should be: ' + str([0.155+0.200+0.614, 0, -0.640-0.100+0.450]))
T_0 = fkpGP12(0, np.pi/2, 0, 0, 0, 0)
end_effector = T_0.dot(np.array(base+[1]).T)[0:3]
print(end_effector)
print()

print('Testing 90 degree upper arm rotation')
print('Should be: ' + str([0.155-0.2, 0, 0.614+0.640+0.1+0.450]))
T_0 = fkpGP12(0, 0, np.pi/2, 0, 0, 0)
end_effector = T_0.dot(np.array(base+[1]).T)[0:3]
print(end_effector)
print()

print('Testing 90 degree wrist roll rotation')
print('Should be: ' + str([0.895, 0, 0.814+0.450]))
T_0 = fkpGP12(0, 0, 0, np.pi/2, 0, 0)
end_effector = T_0.dot(np.array(base+[1]).T)[0:3]
print(end_effector)
print()

print('Testing 90 degree wrist pitch/yaw rotation')
print('Should be: ' + str([0.795, 0, 0.914+0.450]))
T_0 = fkpGP12(0, 0, 0, 0, np.pi/2, 0)
end_effector = T_0.dot(np.array(base+[1]).T)[0:3]
print(end_effector)
print()

print('Testing 90 degree wrist twist rotation')
print('Should be: ' + str([0.895, 0, 0.814+0.450]))
T_0 = fkpGP12(0, 0, 0, 0, 0, np.pi/2)
end_effector = T_0.dot(np.array(base+[1]).T)[0:3]
print(end_effector)
print()

print('Testing 90 degree all rotation')
print('Should be: ' + str([-0.1, 0.155+0.614+0.640, 0.2+0.450]))
T_0 = fkpGP12(np.pi/2, np.pi/2, np.pi/2, np.pi/2, np.pi/2, np.pi/2)
end_effector = T_0.dot(np.array(base+[1]).T)[0:3]
print(end_effector)
print()
