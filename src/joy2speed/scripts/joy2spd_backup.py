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
#last
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
        if (joymsg.buttons[9] == 1) and (joymsg.buttons[9] != lastbutton) :
            if navigation_mode < 3:
                navigation_mode +=1
            else:
                navigation_mode = 0

        modemsg.data = "null"
        if navigation_mode == 0:
            modemsg.data = "Direct"
        if navigation_mode == 1:
            modemsg.data = "Rate_Control"
        if navigation_mode == 2:
            modemsg.data = "Heading_Hold"
        if navigation_mode == 3:
            modemsg.data = "Depth_Hold"
        modepub.publish(modemsg)
            #action that mode is changed is sended to the motion control node 
        lastbutton = joymsg.buttons[9]
        print(navigation_mode)
        if navigation_mode == 0:
            #0: direct mode
            twmsg.linear.x = joymsg.axes[1] #surge
            twmsg.linear.y = joymsg.axes[2] #sway
            twmsg.linear.z = joymsg.axes[3] #heave
            twmsg.angular.y = joymsg.axes[0] #yaw
        if navigation_mode == 1:
            #0: direct mode
            twmsg.linear.x = joymsg.axes[1] #surge
            twmsg.linear.y = joymsg.axes[2] #sway
            twmsg.linear.z = joymsg.axes[3] #heave
            twmsg.angular.y = joymsg.axes[0] #yaw
        if navigation_mode == 2:
            #0: direct mode
            twmsg.linear.x = joymsg.axes[1] #surge
            twmsg.linear.y = joymsg.axes[2] #sway
            twmsg.linear.z = joymsg.axes[3] #heave
            twmsg.angular.y = joymsg.axes[0] #yaw
        
        twpub.publish(twmsg)
    except :
        print("message read error")

def main():
    rospy.init_node('joy2spd')  
    sub = rospy.Subscriber('joy', Joy,callback)
    sub2 = rospy.Subscriber('imu', Imu,callback_imu)
    
    while not rospy.is_shutdown():
        ptcnt(joymsg)
        navigation(joymsg,imumsg)  
        #print(joymsg)      
        r = rospy.Rate(10.0)
        r.sleep()     

if __name__ == '__main__':
	main()
