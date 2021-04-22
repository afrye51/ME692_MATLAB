import dh_lib
import numpy as np

base = np.array([[0], [0], [0], [1]])
joints = [-0.38206331, -0.15023343,  0.76543555,  2.21006204, -0.55175229, -1.05505627]
print('joints: ', joints)
T_0 = dh_lib.fk_lrmate200id_arr(joints)
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

ik_t1 = [-0.382063301904287,-0.382063301904287,-0.382063301904287,-0.382063301904287,2.759529351685506,2.759529351685506,2.759529351685506,2.759529351685506]
ik_t2 = [-0.150233407113215,-0.150233407113215,0.558512440017931,0.558512440017931,-0.553694735931986,-0.553694735931986,-0.155220550025345,-0.155220550025345]
ik_t3 = [0.765435576056402,0.765435576056402,-4.115228105865394,-4.115228105865394,1.072310955207037,1.072310955207037,-4.422103485016029,-4.422103485016029]
ik_t4 = [2.210062039460887,-0.931530614128907,0.944844551179036,-2.196748102410758,-2.057632301071045,1.083960352518748,-1.273958797133043,1.867633856456750]
ik_t5 = [-0.551752287439345,0.551752287439345,-0.545784417760177,0.545784417760177,-0.496069114684095,0.496069114684095,-0.455500124368804,0.455500124368804]
ik_t6 = [-1.055056253342506,2.086536400247288,0.364664125449746,-2.776928528140047,0.204408207105308,-2.937184446484486,-0.665671455432683,2.475921198157110]

for i in range(8):
    T_i = dh_lib.fk_lrmate200id_arr([ik_t1[i], ik_t2[i], ik_t3[i], ik_t4[i],  ik_t5[i], ik_t6[i]])
    print(T_i)
