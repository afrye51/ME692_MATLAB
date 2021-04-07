import numpy as np
import matplotlib.pyplot as plt
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


def ik_iterative_lrmate200id(target_pos):
    dirs = create_dirs_individual()
    converged = False
    base = np.array([[0], [0], [0], [1]])
    current_pos = np.array([0.895, 0, 1.264]).T
    current_joint_state = np.array([0, 0, 0, 0, 0, 0]).T
    k = 0
    # positions = []
    # joint_states = []
    # positions.append(current_pos)
    # joint_states.append(current_joint_state)
    while not converged:

        # Find the best direction to step in
        next_joint_states = current_joint_state + dirs
        next_positions = eval_joint_states(next_joint_states)
        distances = np.linalg.norm(next_positions - target_pos, axis=1)
        best_dir_index = np.argmin(distances)

        # Update the current to state to add in the new step
        current_joint_state = current_joint_state + dirs[best_dir_index]
        current_pos = dh_lib.fk_lrmate200id_arr(current_joint_state).dot(base)[0:3, 0]
        k += 1
        # positions.append(current_pos)
        # joint_states.append(current_joint_state)

        # Check if we have reached the end (stopped moving)
        if best_dir_index == 0:
            converged = True
            target_joint_state = current_joint_state

    return target_joint_state


# target_position = np.array([-0.895, 0, 1.264]).T
# target_joint_state = ik_iterative_lrmate200id(target_position)
#
# error = np.linalg.norm(current_pos - target_pos)
# print(error)
# print(k)
#
# [x, y, z] = np.swapaxes(positions, 0, 1)
# plt.plot(x, z)
# plt.xlim([-2, 2])
# plt.ylim([-2, 2])
# plt.xlabel('x')
# plt.xlabel('z')
# plt.show()
