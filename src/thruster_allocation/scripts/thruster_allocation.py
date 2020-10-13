#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from sensor_msgs.msg import Imu
from geometry_msgs.msg import Twist
from vehicle_msgs.msg import ThrustersCommand
import numpy as np
import math
import json
import collections as cl
twFrc = Twist()
rpmORpwm = "rwm"

thParam = np.array([1,2,3,4,5,6,7]).reshape(1,7)
def getparam():
    global thParam
    num = rospy.get_param("~thnum",6)
    print("num:")
    print(num)
    for i in range(num):
        thParam = np.append(thParam,np.array([
            rospy.get_param("~thruster" + str(i + 1) + "/f2rpm_Forward_C1",0.001), # 1 degree
            rospy.get_param("~thruster" + str(i + 1) + "/f2rpm_Forward_C2",0.000002), # 2 degree
            rospy.get_param("~thruster" + str(i + 1) + "/f2rpm_Reverce_C1",0.001),
            rospy.get_param("~thruster" + str(i + 1) + "/f2rpm_Reverce_C2",0.000002),
            rospy.get_param("~thruster" + str(i + 1) + "/f2rpm_maxrpm",3500), # max rpm must be less than 6553.6 rpm
            rospy.get_param("~thruster" + str(i + 1) + "/f2Rate_Forward",5), # f * param = parsentage  
            rospy.get_param("~thruster" + str(i + 1) + "/f2Rate_Reverce",5)
        ]).reshape(1,7), axis=0)
    thParam = np.delete(thParam,0,0)
    print("thParam:")
    print(thParam)
def f2rpm(f,thParam):
    rpm = []
    lim = 0
    for i in range(len(thParam)):
        if f[i] < 0:
            r = - thParam[i][1] + math.sqrt(thParam[i][1]**2 -4 * thParam[i][0] * -f[i]) / (2 * thParam[i][0])
        else:
            r = -1 * (- thParam[i][3] + math.sqrt(thParam[i][3]**2 -4 * thParam[i][2] * -f[i]) / (2 * thParam[i][2]))
        if lim < r / thParam[i][4]:
            lim = r / thParam[i][4]
        rpm.append(r)
    rpm = np.array(rpm)
    if lim > 1:
        rpm = rpm / lim
    return rpm
def f2Rate(f,thParam):
    rate = []
    for i in range(len(thParam)):
        if f[i] < 0:
            p = f[i] * thParam[i][5]
        else:
            p = f[i] * thParam[i][6]
        rate.append(p)
    rate = np.array(rate)
    if np.max(abs(rate)) / 100.0 > 1:
        rate = rate / ( np.max(abs(rate)) / 100.0 )
    return rate
def thf2thcmd(thf,thParam,rpmORpwm):
    thcmd = ThrustersCommand()
    if rpmORpwm == "rpm":
        #rpmCommand mode
        rpm = f2rpm(thf,thParam)
        thcmd.Thruster1.rpm = rpm[0]
        thcmd.Thruster2.rpm = rpm[1]
        thcmd.Thruster3.rpm = rpm[2]
        thcmd.Thruster4.rpm = rpm[3]
        thcmd.Thruster5.rpm = rpm[4]
        thcmd.Thruster6.rpm = rpm[5]
        thcmd.mode = "rpm"
    else:
        #pwmCommand mode
        rate = f2Rate(thf,thParam)
        #print(rate)
        thcmd.Thruster1.parsentage = rate[0]
        thcmd.Thruster2.parsentage = rate[1]
        thcmd.Thruster3.parsentage = rate[2]
        thcmd.Thruster4.parsentage = rate[3]
        thcmd.Thruster5.parsentage = rate[4]
        thcmd.Thruster6.parsentage = rate[5]
        thcmd.mode = "rate"
    return thcmd
def thrustallocation(f,im):
    _f = np.array([f.linear.x, f.linear.y, f.linear.z, f.angular.x, f.angular.y, f.angular.z])
    thf = im.dot(_f)
    return thf
def frc_callback(message):
    global twFrc
    twFrc = message
def rot(deg):
    radx = deg[0] * np.pi /180
    rady = deg[1] * np.pi /180
    radz = deg[2] * np.pi /180
    Rx = np.array([[1,0,0],
             [0,np.cos(radx),-np.sin(radx)],
             [0,np.sin(radx),np.cos(radx)]])
    Ry = np.array([[np.cos(rady),0,np.sin(rady)],
             [0,1,0],
             [-np.sin(rady),0,np.cos(rady)]])
    Rz = np.array([[np.cos(radz),-np.sin(radz),0],
             [np.sin(radz),np.cos(radz),0],
                  [0,0,1]])
    R = Rx.dot(Ry).dot(Rz)
    return R
def getThrustAllocator(jsonfile):
    thPosList, thAngleList = getThrustAligin(jsonfile)
    Z = np.array([0,0,1])
    f = rot(thAngleList[0]).dot(Z) #thrust vector
    m = np.cross(thPosList[0],f) #moment vector
    b = np.append(f,m,axis=0).reshape(6,1) #Thrust to Force matrix
    for i in range(1,6):
        f = rot(thAngleList[i]).dot(Z)
        m = np.cross(thPosList[i],f)
        b = np.append(b,np.append(f,m,axis=0).reshape(6,1),axis=1)
    return np.linalg.pinv(b) # InverseMatrix
def getThrustAligin(jsonfile):
    f = open(jsonfile, 'r')
    TH_Alloc = json.load(f)
    thPosList = []
    thAngleList = []
    for i in range(6):
        thPosList.append(TH_Alloc["TH"+str(i + 1)]["Pos"])
        thAngleList.append(TH_Alloc["TH"+str(i + 1)]["Angle"])
    print("ThAlloc:")
    print("Pos:")
    print(thPosList)
    print("Angle")
    print(thAngleList)
    return thPosList, thAngleList
def main():
    rospy.init_node("thrustAllocator")
    frcSub = rospy.Subscriber('twistFrc', Twist,frc_callback)
    cmdPub = rospy.Publisher('thrustcmd',ThrustersCommand,queue_size=10)
    im =  getThrustAllocator("/home/ubuntu/catkin_ws/src/thruster_allocation/scripts/TH_Alloc.json")
    getparam()
    r = rospy.Rate(20.0)
    
    while not rospy.is_shutdown():
        thf = thrustallocation(twFrc,im)
        thcom = thf2thcmd(thf,thParam,rpmORpwm)
        cmdPub.publish(thcom)
        r.sleep()

if __name__ == "__main__":
    main()