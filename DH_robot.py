import numpy as np
import matplotlib.pyplot as plt


class DH_robot:

    # Parameters
    # DH_table
    #   list of lists (row-major order) representing a DH table.
    #   Each element should be a string, containing values and/or variables
    #   represented as 'var1', 'var2'...
    #   ex: '0', '-pi/2', '0.707', 'var1'
    def __init__(self, DH_table):
        self.DH_table = DH_table

        self.num_parameter_variables = 0
        num_rows = len(DH_table)
        self.parameters = np.zeros((num_rows, 4))
        self.parameter_variables = {}

        for i in range(np.shape(DH_table)[0]):
            for j in range(np.shape(DH_table)[1]):
                if type(DH_table[i][j]) == str:
                    self.num_parameter_variables += 1
                    param_num = int(DH_table[i][j][-1])
                    self.parameter_variables[param_num] = [i, j]
                    self.parameters[i, j] = 0
                else:
                    self.parameters[i, j] = DH_table[i][j]

    def dh_transform(self, parameters):
        [theta, d, a, alpha] = parameters
        return np.zeros((4, 4))

    def generate_transform(self, parameters):
        if len(parameters) != self.num_parameter_variables:
            print('invalid number of parameters')
            return np.zeros((4, 4))

        transform = np.eye(4)
        for i in range(len(parameters)):
            param_loc = self.parameter_variables[i]
            this_param = self.parameters[param_loc[0], :]
            this_param[param_loc[1]] = parameters[i]
            transform.dot(self.generate_transform(this_param))

        return transform
