import numpy as np
import dh_lib


def eval_joint_states(joint_states):
    base = np.array([[0], [0], [0], [1]])
    position = np.zeros((np.shape(joint_states)[0], 3))
    for i in range(np.shape(joint_states)[0]):
        T_0 = dh_lib.fk_lrmate200id_arr(joint_states[i])
        position[i, :] = T_0.dot(base)[0:3, 0]
    return position


def create_dirs_all(dim=6, step=0.001):
    # Create list of all possible steps in all possible directions
    dirs = np.zeros((3**dim, dim))
    for i in range(3**dim):
        short = np.array(list(np.base_repr(i, base=3)))
        dirs[i, :] = np.pad(short, (dim - np.shape(short)[0], 0), 'constant')
    dirs = (dirs - 1) * step
    return dirs


def create_dirs_individual(dim=6, step=0.001):
    # Create list of all possible steps in all possible directions
    dirs = np.zeros((2*dim + 1, dim))
    dir = [-1, 1]
    for i in range(dim):
        for j in range(2):
            dirs[i*2 + j + 1, i] = dir[j]
    dirs = dirs * step
    return dirs
