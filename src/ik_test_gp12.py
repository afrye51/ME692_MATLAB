#!/usr/bin/env python
from __future__ import print_function
import os
import roslib
import sys
import rospy
import numpy as np
import time
import sensor_msgs.msg
import geometry_msgs.msg
import ik_iterative_gp12

roslib.load_manifest('ME692_MATLAB')


class GP12_ik:

    def __init__(self):
        self.position_sub = rospy.Subscriber('/gp12_ee_pose', geometry_msgs.msg.Pose, self.ik_callback)
        self.joint_pub = rospy.Publisher('/ik_joint_states', sensor_msgs.msg.JointState, queue_size=1)

    def ik_callback(self, msg):
        print('got callback, sending to IK')
        target_position = [msg.position.x, msg.position.y, msg.position.z]
        target_position = np.array(target_position).T
        target_joint_states = ik_iterative_gp12.ik_iterative_gp12(target_position)

        print('Finished IK, sending to joint_state_publisher')
        joint_msg = sensor_msgs.msg.JointState()
        joint_msg.header.stamp = rospy.Time.now()
        joint_msg.name = ['joint_1_s', 'joint_2_l', 'joint_3_u', 'joint_4_r', 'joint_5_b', 'joint_6_t']
        joint_msg.position = list(target_joint_states.T)
        self.joint_pub.publish(joint_msg)


def main(args):
    print('hi')
    rospy.init_node('gp12_iterative_ik_node', anonymous=True)
    ik = GP12_ik()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")


if __name__ == "__main__":
    main(sys.argv)
