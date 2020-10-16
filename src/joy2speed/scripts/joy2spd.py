#!/usr/bin/env python

import rospy
import math
import copy
from sensor_msgs.msg import Joy
from sensor_msgs.msg import Imu
from geometry_msgs.msg import Twist
from pt_msg.msg import PanTiltAngles
from std_msgs.msg import String


ptpub = rospy.Publisher('PanTiltAngles',PanTiltAngles,queue_size=10)
twpub = rospy.Publisher('twistSpd',Twist,queue_size=10)
modepub = rospy.Publisher('mode',String,queue_size=10)
joymsg = Joy()
imumsg = Imu()
panangle = 0
tiltangle = 0
navigation_mode = 0
lastbutton = 0
#const
JOY_AXIS_SURGE = 3
JOY_AXIS_HEAVE = 1
JOY_AXIS_SWAY = 0
JOY_AXIS_YAW = 2

#param
max_surgeSpd, max_swaySpd, max_heaveSpd = 0,0,0 # m/s
max_pitchRate, max_rollRate, max_yawRate = 0,0,0 # rad/s

def getParam():
    global max_surgeSpd, max_swaySpd, max_heaveSpd # m/s
    global max_pitchRate, max_rollRate, max_yawRate # rad/s
    max_surgeSpd = rospy.get_param("~max_surgeSpd",1.5)
    max_swaySpd = rospy.get_param("~max_swaySpd",0.5)
    max_heaveSpd = rospy.get_param("~max_heaveSpd",0.5)
    max_pitchRate = rospy.get_param("~max_pitchRate",6.28)
    max_rollRate = rospy.get_param("~max_rollRate",6.28)
    max_yawRate = rospy.get_param("~max_yawRate",6.28)
    print("max_surgeSpd:" + str(max_surgeSpd))
    print("max_swaySpd:" + str(max_swaySpd))
    print("max_heaveSpd:" + str(max_heaveSpd))
    print("max_pitchRate:" + str(max_pitchRate))
    print("max_rollRate:" + str(max_rollRate))
    print("max_yawRate:" + str(max_yawRate))

def callback(message):
    global joymsg
    joymsg = message
    
def callback_imu(message):
    global imumsg
    imumsg = message

def ptcnt(msg):
    global panangle
    global tiltangle
    #PanTilt
    try:
        if (msg.buttons[12] == 1) and (msg.buttons[13] == 0) and tiltangle < 45:
            tiltangle +=0.5
        if (msg.buttons[13] == 1) and (msg.buttons[12] == 0) and tiltangle > -45:
            tiltangle -=0.5
        if (msg.buttons[14] == 1) and (msg.buttons[15] == 0) and panangle < 45:
            panangle +=0.5
        if (msg.buttons[15] == 1) and (msg.buttons[16] == 0) and panangle > -45:
            panangle -=0.5
        if (msg.buttons[8] == 1) :
            panangle = 0
            tiltangle = 0
        ptmsg = PanTiltAngles()
        ptmsg.pan = panangle
        ptmsg.tilt = tiltangle
        ptpub.publish(ptmsg)
    except :
        print("message read error")
    
def navigation(joymsg,imumsg):
    #0: direct, 1: rate control, 2:rate and abusolute heading and depth
    global navigation_mode
    global lastbutton
    twmsg = Twist()
    modemsg = String()
    try:
        if joymsg.header.frame_id == "xinput":
            mode_bottun = joymsg.buttons[9]
        if joymsg.header.frame_id == "Speedy Gaming Controller Extended Gamepad":
            mode_bottun = joymsg.buttons[4]
        if (mode_bottun == 1) and (mode_bottun != lastbutton) :
            if navigation_mode < 3:
                navigation_mode +=1
            else:
                navigation_mode = 0

            modemsg.data = "null"
            if navigation_mode == 0:
                modemsg.data = "Direct"
            if navigation_mode == 1:
                modemsg.data = "Stabilize"
            if navigation_mode == 2:
                modemsg.data = "DepthHold"
            if navigation_mode == 3:
                modemsg.data = "MultiAttitude"
            modepub.publish(modemsg)
            print(navigation_mode)
        lastbutton = mode_bottun

        twmsg.linear.x = joymsg.axes[JOY_AXIS_SURGE] * max_surgeSpd
        twmsg.linear.y = joymsg.axes[JOY_AXIS_SWAY] * max_swaySpd
        twmsg.linear.z = joymsg.axes[JOY_AXIS_HEAVE] * max_heaveSpd
        twmsg.angular.z = joymsg.axes[JOY_AXIS_YAW] * max_yawRate * -1
        
        twpub.publish(twmsg)
    except :
        print("message read error")

def main():
    rospy.init_node('joy2spd')  
    sub = rospy.Subscriber('joy', Joy,callback)
    sub2 = rospy.Subscriber('imu', Imu,callback_imu)
    getParam()    
    r = rospy.Rate(10.0)
    
    while not rospy.is_shutdown():
        ptcnt(joymsg)
        navigation(joymsg,imumsg)  
        #print(joymsg)      
        r.sleep()     

if __name__ == '__main__':
	main()
