#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Imu
from geometry_msgs.msg import Vector3
import tf
import math
import numpy as np


eular = Vector3()
eular2 = Vector3()
acc = Vector3()
imu = Imu()
#acc_t = tf.transformations.setRotation(tf.createQuaternionFromRPY(math.pi,0,math.pi/2))
rm = tf.transformations.euler_matrix(math.pi,0,-math.pi/2,'sxyz')
posrm = tf.transformations.quaternion_from_euler(math.pi,0,-math.pi/2,'sxyz')
def imu_callback(message):
    global eular
    global eular2
    global acc
    global imu
    imu = message
    #print(message)
    #e = tf.transformations.euler_from_quaternion((message.orientation.x, message.orientation.y, message.orientation.z, message.orientation.w))
    #e_ =  ([message.orientation.x, message.orientation.y, message.orientation.z, message.orientation.w])
    q = tf.transformations.quaternion_multiply([message.orientation.x, message.orientation.y, message.orientation.z, message.orientation.w],posrm)
    e2 = tf.transformations.euler_from_quaternion((q[0], q[1], q[2], q[3]))
    #roll, pitch, yaw = quatanion2eular(message.orientation.x, message.orientation.y, message.orientation.z, message.orientation.w)
    #roll, pitch, yaw = q2eular(message.orientation.x, message.orientation.y, message.orientation.z, message.orientation.w)
    #acc = acc_t * tfd.Vector3(message.acceleration.x,message.acceleration.y,message.acceleration.z)
    #eular.x = e[0] *180 / math.pi
    #eular.y = e[1] *180 / math.pi
    #eular.z = e[2] *180 / math.pi
    if e2[0] > 0:
        eular2.x = e2[0] - math.pi
    else:
        eular2.x = e2[0] + math.pi
    eular2.x = eular2.x  * 180 / math.pi
    eular2.y = e2[1] * -1 * 180 / math.pi
    eular2.z = e2[2] * -1 * 180 / math.pi

def q2eular(x,y,z,w):
    q0 = x
    q1 = y
    q2 = z
    q3 = w

    #pitch = math.atan2(-2 * (q0 * q1 + q3 * q2 ) , (1 - 2 * math.pow(q0,2) - math.pow(q2,2)))
    #yaw = math.atan2(-2 * (q0 * q2 + q3 * q1 ) , (1 - 2 * math.pow(q0,2) - math.pow(q1,2)))
    #roll = math.atan2( 2 * (q1 * q3 - q3 * q2) , (1 - 2 * math.pow(q0,2) - math.pow(q1,2)) / math.cos(pitch) )
    
    roll = math.atan2(2 * (q0 * q1 + q2 * q3 ) , (math.pow(q0,2) - math.pow(q1,2) - math.pow(q2,2) + math.pow(q3,2)))
    #pitch = math.asin( 2 * (q0 * q2 - q3 * q1))
    pitch = math.atan2( 2 * (q0 * q2 - q3 * q1), (2 * (q2 * q3 + q0 * q1)) / math.sin(roll)) 
    yaw = math.atan2(2 * (q0 * q3 + q1 * q2 ) , (math.pow(q0,2) + math.pow(q1,2) - math.pow(q2,2) - math.pow(q3,2)))

    return roll, pitch, yaw

def quatanion2eular(x,y,z,w):
    q0 = x
    q1 = y
    q2 = z
    q3 = w
    roll = math.atan2(2 * (q0 * q1 + q2 * q3 ) , (math.pow(q0,2) - math.pow(q1,2) - math.pow(q2,2) + math.pow(q3,2)))
    pitch = math.acos( 2 * (q0 * q2 - q3 * q1))
    yaw = math.atan2(2 * (q0 * q3 + q1 * q2 ) , (math.pow(q0,2) + math.pow(q1,2) - math.pow(q2,2) - math.pow(q3,2)))
    yaw =  2 * (q0 * q2 - q1 * q3)
    return roll, pitch, yaw

def main():
    rospy.init_node("tf_test")
    imuSub = rospy.Subscriber('imu', Imu,imu_callback)
    r = rospy.Rate(10.0)



    print(rm)
    while not rospy.is_shutdown():
        print("Raw:")
        print("   x: " + str(eular.x))
        print("   y: " + str(eular.y))
        print("   z: " + str(eular.z))
        print("Transformed:")
        print("   x: " + str(eular2.x))
        print("   y: " + str(eular2.y))
        print("   z: " + str(eular2.z))
        vacc = np.dot(rm,[imu.linear_acceleration.x,imu.linear_acceleration.y,imu.linear_acceleration.z,1])
        #print(q)
        #print(imu.linear_acceleration)
        #print(posrm)
        #print(imu.orientation)
        r.sleep()
if __name__ == "__main__":
    main()