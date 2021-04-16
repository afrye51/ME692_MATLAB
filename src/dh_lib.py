import numpy as np


# Compute and return a 4x4 real homogenous transform from 4 D-H parameters
# Parameters
#   theta - angle in radians
#   d - distance in meters
#   a - distance in meters (sometimes referred to as r)
#   alpha - angle in radians
# Returns
#   T - 4x4 homogenous transform from link i-1 to link i
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


# Forward kinematics with angle directions as described in all materials
def fk_gp12(t1, t2, t3, t4, t5, t6):
    T = np.eye(4)
    T = T.dot(dh_transform(t1, 0.450, 0.155, -np.pi/2))
    T = T.dot(dh_transform(t2-np.pi/2, 0, 0.614, np.pi))
    T = T.dot(dh_transform(t3, 0, 0.200, -np.pi/2))
    T = T.dot(dh_transform(t4, -0.640, 0, np.pi/2))
    T = T.dot(dh_transform(t5, 0, 0, -np.pi/2))
    T = T.dot(dh_transform(t6, -0.100, 0, np.pi))
    return T


# Forward kinematics with angle directions as described in all materials
def fk_gp12_arr(t):
    [t1, t2, t3, t4, t5, t6] = t
    return fk_gp12(t1, t2, t3, t4, t5, t6)


# Forward kinematics with angle directions as described in all materials
def fk_lrmate200id(t1, t2, t3, t4, t5, t6):
    T = np.eye(4)
    T = T.dot(dh_transform(t1, 0.330, 0.050, -np.pi/2))
    T = T.dot(dh_transform(t2-np.pi/2, 0, 0.330, np.pi))
    T = T.dot(dh_transform(t3, 0, 0.035, -np.pi/2))
    T = np.eye(4)
    T = T.dot(dh_transform(t4, -0.335, 0, np.pi/2))
    T = T.dot(dh_transform(t5, 0, 0, -np.pi/2))
    T = T.dot(dh_transform(t6, -0.080, 0, np.pi))
    return T


# Forward kinematics with angle directions as described in all materials
def fk_lrmate200id_arr(t):
    [t1, t2, t3, t4, t5, t6] = t
    return fk_lrmate200id(t1, t2, t3, t4, t5, t6)

