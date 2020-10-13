#!/usr/bin/env python

#test
import rospy
import can
import struct
from vehicle_msgs.msg import ThrustersCommand
#from __future__ import print_function
#import csv
#import time
#can configuration
bus = can.interface.Bus(channel='can0',bustype='socketcan',bitrate=1000000)


def callback(message):
    b1 = struct.pack('>h',message.Thruster1.rpm)
    b2 = struct.pack('>h',message.Thruster2.rpm)
    b3 = struct.pack('>h',message.Thruster3.rpm)
    b4 = struct.pack('>h',message.Thruster4.rpm)
    b5 = struct.pack('>h',message.Thruster5.rpm)
    b6 = struct.pack('>h',message.Thruster6.rpm)
    msg = can.Message(arbitration_id=0x74, dlc=8, data=[b1[0], b1[1], b2[0], b2[1], b3[0], b3[1], b4[0], b4[1]],extended_id=False)
	#can.Message(timestamp=0.0, arbitration_id=0, is_extended_id=None, is_remote_frame=False, 
	# is_error_frame=False, channel=None, dlc=None, data=None, is_fd=False, bitrate_switch=False, 
	# error_state_indicator=False, extended_id=True, check=False)
    bus.send(msg)
    msg = can.Message(arbitration_id=0x75, dlc=8, data=[b5[0], b5[1],b6[0],b6[1]],extended_id=False)
    bus.send(msg)
    #print(message.Thruster1.rpm)
    #print(str(b1[0]))
    #print(str(b1[1]))
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

def main():
	#Ros configuration
    rospy.init_node('can_Parser')
    #sub = rospy.Subscriber('cahtter', Float64,callback)  
    sub = rospy.Subscriber('ThrustersCommand', ThrustersCommand,callback)  
	#pub = rospy.Publisher('PT', PanTiltAngles, queue_size=10)

    #can configuration
    #bus = can.interface.Bus(channel='can0',bustype='socketcan',bitrate=1000000)

    #Recieve waiting loop
    id = 0
    dlc = 0
    while not rospy.is_shutdown():
        #print("test")
        #msg = can.Message(arbitration_id=0x74, dlc=8, data=[0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],extended_id=False)
        #bus.send(msg)
        msg = bus.recv(0.5)
        print(msg)
        r = rospy.Rate(100.0)
        r.sleep()

        

if __name__ == '__main__':
	main()
