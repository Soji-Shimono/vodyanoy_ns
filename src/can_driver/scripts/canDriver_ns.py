#!/usr/bin/env python

#test
import rospy
import can
import struct
from vehicle_msgs.msg import ThrustersCommand
from sensor_msgs.msg import BatteryState
from sensor_msgs.msg import Temperature
from geometry_msgs.msg import Point

bus = can.interface.Bus(channel='can0',bustype='socketcan',bitrate=1000000)
battmsg = BatteryState()
tempmsg = Temperature()
depthmsg = Point()
# max rpm
# Thruster com: int16
# 1 count = 0.2 rpm
# 32768 * 0.2 = 6553.6
dT = 0
DEADBAND = 1
MAX_COMMAND = 10000

def callback(message):
    mode = 0
    if message.mode == "rpm":
        for i in range():
            _b2 = rpm2com(message.Thruster1.rpm,MAX_COMMAND,DEADBAND)
            _b3 = rpm2com(message.Thruster2.rpm,MAX_COMMAND,DEADBAND)
            _b6 = rpm2com(message.Thruster3.rpm,MAX_COMMAND,DEADBAND)
            _b5 = rpm2com(message.Thruster4.rpm,MAX_COMMAND,DEADBAND)
            _b4 = rpm2com(message.Thruster5.rpm,MAX_COMMAND,DEADBAND)
            _b1 = rpm2com(message.Thruster6.rpm,MAX_COMMAND,DEADBAND)

            print("mode1")
            mode = 1
    if message.mode == "rate":
            _b2 = rate2com(message.Thruster1.parsentage * -1.0,MAX_COMMAND,DEADBAND)
            _b3 = rate2com(message.Thruster2.parsentage * -1.0,MAX_COMMAND,DEADBAND)
            _b6 = rate2com(message.Thruster3.parsentage * -1.0,MAX_COMMAND,DEADBAND)
            _b5 = rate2com(message.Thruster4.parsentage,MAX_COMMAND,DEADBAND)
            _b4 = rate2com(message.Thruster5.parsentage,MAX_COMMAND,DEADBAND)
            _b1 = rate2com(message.Thruster6.parsentage,MAX_COMMAND,DEADBAND)

            mode = 2
            print("mode2")
    else:
            _b1 = int(message.Thruster1.rpm * 5)
            _b2 = int(message.Thruster2.rpm * 5)
            _b3 = int(message.Thruster3.rpm * 5)
            _b4 = int(message.Thruster4.rpm * 5)
            _b5 = int(message.Thruster5.rpm * 5)
            _b6 = int(message.Thruster6.rpm * 5)
            print("mode_")
    
    b1 = struct.pack('>h',_b1)
    b2 = struct.pack('>h',_b2)
    b3 = struct.pack('>h',_b3)
    b4 = struct.pack('>h',_b4)
    b5 = struct.pack('>h',_b5)
    b6 = struct.pack('>h',_b6)

    msg = can.Message(arbitration_id=0x73, dlc=1, data=[mode],extended_id=False)
    #print(msg)
    #bus.send(msg)
    msg = can.Message(arbitration_id=0x74, dlc=8, data=[b1[0], b1[1], b2[0], b2[1], b3[0], b3[1], b4[0], b4[1]],extended_id=False)
    #bus.send(msg)
    print(msg)
    msg = can.Message(arbitration_id=0x75, dlc=4, data=[b5[0], b5[1], b6[0], b6[1]], extended_id=False)
    #bus.send(msg)
    print(msg)
    #print("Data_Received")
    #print("test")
	#can.Message(timestamp=0.0, arbitration_id=0, is_extended_id=None, is_remote_frame=False, 
	# is_error_frame=False, channel=None, dlc=None, data=None, is_fd=False, bitrate_switch=False, 
	# error_state_indicator=False, extended_id=True, check=False)

def rate2com(rate,LIMIT,band):
    t = int(rate / 100 * LIMIT)
    if abs(t) < band:
        t = 0
    return t

def rpm2com(rpm,LIMIT,band):
    t = int(rpm * 5)
    if abs(t) < band:
        t = 0
    if abs(t) > LIMIT:
        t = LIMIT * t / abs(t)
    return int(t)

def int_from_bytes(b):
    '''Convert big-endian signed integer bytearray to int
    int_from_bytes(b) == int.from_bytes(b, 'big', signed=True)'''
    if not b: # special-case 0 to avoid b[0] raising
        return 0
    n = b[0] & 0x7f # skip sign bit
    for by in b[1:]:
        n = n * 256 + by
    if b[0] & 0x80: # if sign bit is set, 2's complement
        bits = 8*len(b)
        offset = 2**(bits-1)
        return n - offset
    else:
        return n
def calctemp(msg,t):
	d = msg.data[0] * 2**24 + msg.data[1] * 2**16 + msg.data[2] * 2**8 + msg.data[3]
	out = 0
	global dT
	dT = t
	if msg.arbitration_id == 21:
		dT = d - 26951.0 * 2**8
		out = 2000.0 + dT * 26700.0/(2**23)
	elif msg.arbitration_id == 20:
		OFF = 28048.0 *(2**16)+(17636.0*dT)/(2**7)
		SENS = 29566.0 * (2**15) + (17703.0 * dT)/(2**8)
		out = (d * SENS / (2**21) -OFF)/(2**13)
	return out
def battInfo_update(msg):
    v = (msg.data[0] * 2**8 + msg.data[1]) *1.25/1000
    a = (msg.data[2] * 2**8 + msg.data[3]) *2560/2048/1000.0
    out = [v,a]
    return out


def main():
	#Ros configuration
    rospy.init_node('can_driver')
    sub = rospy.Subscriber('thrustcmd', ThrustersCommand,callback)
    print('test2')
    pub_temp = rospy.Publisher('Temp',Temperature,queue_size=10)
    pub_batt = rospy.Publisher('BatteryState',BatteryState,queue_size=10)
    pub_depth = rospy.Publisher('Depth',Point,queue_size=10)
    #rospy.spin()
    r = rospy.Rate(1000)
    #r = rospy.Rate(1)
    #while not rospy.is_shutdown():
    while 1:
        #print("rate")
        msg = bus.recv(0.5)
        '''
        if msg.arbitration_id ==20:
            depthmsg.z = ((calctemp(msg,dT)/10.0) *100.0 -101325) / (1023 * 9.81)
            pub_depth.publish(depthmsg)
        elif msg.arbitration_id == 21:
            tempmsg.temperature = calctemp(msg,dT)/100.0
            pub_temp.publish(tempmsg)
        elif msg.arbitration_id == 22:
            battmsg.voltage = battInfo_update(msg)[0]
            battmsg.current = battInfo_update(msg)[1]
            pub_batt.publish(battmsg)
        '''
        #r.sleep()        

if __name__ == '__main__':
	main()


