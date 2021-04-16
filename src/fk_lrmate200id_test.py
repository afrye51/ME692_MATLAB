import dh_lib
import numpy as np

base = np.array([[0], [0], [0], [1]])
joints = np.random.randn(6, 1)
print('joints: ', joints)
T_0 = dh_lib.fk_lrmate200id_arr(joints)
print('translation: ', T_0.dot(base)[0:3, 0])
# ik_lrmate200id(0.1059, 0.2679, 0.3588, 0, 0, 0)
