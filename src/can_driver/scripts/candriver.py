#!/usr/bin/env python

#test
import rospy
import can
#from __future__ import print_function
#import csv
#import time

def callback(message):
    rospy.loginfo(str(message.data))
	#write your application code
    msg = can.Message(arbitration_id=0x40, dlc=4, data=[0xde, 0xad, 0xbe, 0xaf])
	#can.Message(timestamp=0.0, arbitration_id=0, is_extended_id=None, is_remote_frame=False, 
	# is_error_frame=False, channel=None, dlc=None, data=None, is_fd=False, bitrate_switch=False, 
	# error_state_indicator=False, extended_id=True, check=False)
    bus.send(msg)
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
    rospy.init_node('can_Driver')
    #sub = rospy.Subscriber('cahtter', Float64,callback)    
	#pub = rospy.Publisher('PT', PanTiltAngles, queue_size=10)

    #can configuration
    bus = can.interface.Bus(channel='can0',bustype='socketcan')

    #Recieve waiting loop
    id = 0
    dlc = 0
    while not rospy.is_shutdown():
        msg = bus.recv(0.5) # timeout
        try:
            print str(msg.timestamp) + "ID: " + str(msg.arbitration_id) + " Data: ",
            for i in range(msg.dlc):
                print " " + str(msg.data[i]),
            print
            
            b = bytearray(b'\x00\x00')
            #val = bytearray(b'\x8f\x0f\xfd\x02\xf4\x95s\x00\x00')
            b[0] = msg.data[0]
            b[1] = msg.data[1]
            a = int_from_bytes(b)
            #a = int.from_bytes(val, byteorder='big', signed=True)
            #a =100
            print(str(a))
            id = msg.arbitration_id
            dlc = msg.dlc
            if id == 1:
                #Please write application code
                #pub.publish(mesages)
                a = 1
            elif id == 2:
                #Please write application code
                #pub.publish(mesages)
                a = 1
            elif id == 3:
                #Please write application code
                #pub.publish(mesages)
                a = 1
        except:
            pass

if __name__ == '__main__':
	main()
