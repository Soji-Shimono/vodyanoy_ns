#!/usr/bin/env python
import rospy
#from std_msgs.msg import Float64
from pt_msg.msg import PanTiltAngles
import pigpio

pan = 18
tilt = 13
i = 0
pi = pigpio.pi()
pi.set_mode(pan,pigpio.OUTPUT)
pi.set_mode(tilt,pigpio.OUTPUT)

def callback(message):
	rospy.loginfo(str(message))
	pi.hardware_PWM(pan, 50, (-message.pan + 39.0) * 750 + 30000)
	pi.hardware_PWM(tilt,50,(-message.tilt + 51.0) * 750 + 30000)
#def callback2(message):
#	rospy.loginfo(str(message.data))
#	pi.hardware_PWM(tilt, 50, message.data * 750 + 30000)

rospy.init_node('PT_cnt')
sub = rospy.Subscriber('PanTiltAngles', PanTiltAngles,callback)
#sud2 = rospy.Subscriber('cahtter2',Float64,callback2)
#rate = rospy.Rate(1)
rospy.spin()

#while not rospy.is_shutdown():
#	print(str(i))
#	pi.hardware_PWM(pan, 50, i * 100000)
#	pi.hardware_PWM(tilt, 50, i * 100000)
#	i += 1
#	if i == 9:
#		i = 0
#	rate.sleep()
