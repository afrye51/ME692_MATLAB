#!/usr/bin/env python
from __future__ import print_function
import os
# import roslib
# import sys
# import rospy
import numpy as np
import time
# import sensor_msgs.msg
# import geometry_msgs.msg
import ik_iterative_lrmate200id

# roslib.load_manifest('ME692_MATLAB')


class GP12_ik:

    def __init__(self):
        self.position_sub = rospy.Subscriber('/lrmate200id_ee_pose', geometry_msgs.msg.Pose, self.ik_callback)
        self.joint_pub = rospy.Publisher('/ik_joint_states', sensor_msgs.msg.JointState, queue_size=1)

    def ik_callback(self, msg):
        print('got callback, sending to IK')
        target_position = [msg.position.x, msg.position.y, msg.position.z]
        target_position = np.array(target_position).T
        target_joint_states = ik_iterative_lrmate200id.ik_iterative_lrmate200id(target_position)

        print('Finished IK, sending to joint_state_publisher')
        joint_msg = sensor_msgs.msg.JointState()
        joint_msg.header.stamp = rospy.Time.now()
        joint_msg.name = ['joint_1', 'joint_2', 'joint_3', 'joint_4', 'joint_5', 'joint_6']
        joint_msg.position = list(target_joint_states.T)
        self.joint_pub.publish(joint_msg)


def main(args):
    target_position = [0, 0, 100000]
    target_position = np.array(target_position).T
    target_joint_states = ik_iterative_lrmate200id.ik_iterative_lrmate200id(target_position)
    print(target_joint_states)
    rospy.init_node('lrmate200id_iterative_ik_node', anonymous=True)
    ik = GP12_ik()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")


if __name__ == "__main__":
    main(None)#sys.argv)
