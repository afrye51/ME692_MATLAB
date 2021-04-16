import dh_lib
import numpy as np

base = np.array([[0], [0], [0], [1]])
joints = [-0.38206331, -0.15023343,  0.76543555,  2.21006204, -0.55175229, -1.05505627]
print('joints: ', joints)
T_0 = dh_lib.fk_lrmate200id_arr(joints)
print('translation: ', T_0.dot(base)[0:3, 0])
base_rot = np.array([[1], [0], [0]])
rotm = T_0[0:3, 0:3]
rotation = rotm.dot(base_rot)
print('rotation: ', rotation[0:3, 0])
print('matrix: ', T_0)
# ik_lrmate200id(0.1059, 0.2679, 0.3588, 0, 0, 0)
# joints:  [[-0.38206331]
#           [-0.15023343]
#           [ 0.76543555]
#           [ 2.21006204]
#           [-0.55175229]
#           [-1.05505627]]
# translation:  [array([0.17175785]) array([-0.10528242]) array([1.01251874])]
# matrix:  [[array([0.13599407]) array([-0.98619298]) array([0.09449353])
#            array([0.17175785])]
#           [array([0.86794202]) array([0.07261006]) array([-0.49132926])
#           array([-0.10528242])]
# [array([0.47768428]) array([0.14883277]) array([0.86583286])
# array([1.01251874])]
# [array([0.]) array([0.]) array([0.]) array([1.])]]
