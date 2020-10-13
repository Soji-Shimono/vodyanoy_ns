#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from sensor_msgs.msg import Imu
from geometry_msgs.msg import Twist

mode = 0
twSpd = Twist()
#param
spd2frc_surge, spd2frc_sway, spd2frc_heave = 0,0,0 # m/s
spd2frc_pitch, spd2frc_roll, spd2frc_yaw = 0,0,0 # rad/s

def getparam():
    global spd2frc_surge, spd2frc_sway, spd2frc_heave, spd2frc_pitch, spd2frc_roll, spd2frc_yaw
    spd2frc_surge = rospy.get_param("~spd2frc_surge",1)
    spd2frc_sway = rospy.get_param("~spd2frc_sway",1)
    spd2frc_heave = rospy.get_param("~spd2frc_heave",1)
    spd2frc_pitch = rospy.get_param("~spd2frc_pitch",1)
    spd2frc_roll = rospy.get_param("~spd2frc_roll",1)
    spd2frc_yaw = rospy.get_param("~spd2frc_yaw",1)
    
    print("surge" + str(spd2frc_surge))
    print("sway" + str(spd2frc_sway))
def mode_callback(message):
    global mode
    mode = 1
    if message.data =="Direct":
        mode =0
    print(mode)

def spd_callback(message):
    global twSpd
    twSpd = message

def main():
    rospy.init_node("motion_controler")
    modeSub = rospy.Subscriber('mode', String,mode_callback)
    spdSub = rospy.Subscriber('twistSpd', Twist,spd_callback)
    FrcPub = rospy.Publisher('twistFrc',Twist,queue_size=10)
    getparam()
    r = rospy.Rate(10.0)
    
    while not rospy.is_shutdown():
        #
        twFrc = Twist()
        if mode == 0:
            #print("Dict mode executing.")
            twFrc.linear.x = twSpd.linear.x * spd2frc_surge
            twFrc.linear.y = twSpd.linear.y * spd2frc_sway
            twFrc.linear.z = twSpd.linear.z * spd2frc_heave
            twFrc.angular.z = twSpd.angular.z * spd2frc_yaw
        else:
            print("Rate control mode executing.")
        r.sleep()
        FrcPub.publish(twFrc)

if __name__ == "__main__":
    main()