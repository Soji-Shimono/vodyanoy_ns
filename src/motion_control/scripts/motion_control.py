#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from sensor_msgs.msg import Imu
from geometry_msgs.msg import Twist
import math
from geometry_msgs.msg import Point
from geometry_msgs.msg import Vector3
import numpy as np
import tf


mode = 0
last_mode = 0
twSpd = Twist()
imu = Imu()
eular = Vector3()
eular2 = Vector3()
pitch, roll, yaw = 0,0,0
vacc = Vector3()
vangv = Vector3()
vang = Vector3()
targetPos = Vector3()
targetAngle = Vector3()
vspd = Vector3()
rm = tf.transformations.euler_matrix(math.pi,0,-math.pi/2,'sxyz')
posrm = tf.transformations.quaternion_from_euler(math.pi,0,-math.pi/2,'sxyz')

#param
spd2frc_surge, spd2frc_sway, spd2frc_heave = 0,0,0 #[kg/m]
spd2frc_pitch, spd2frc_roll, spd2frc_yaw = 0,0,0 #[Nm/s]
YAW_P, YAW_I, YAW_D, YAW_FF = 0,0,0,0 #PID,feedforward param
ROLL_P, ROLL_I, ROLL_D, ROLL_FF = 0,0,0,0 #PID,feedforward param
PITCH_P, PITCH_I, PITCH_D, PITCH_FF = 0,0,0,0 #PID,feedforward param
DEPTH_P, DEPTH_I, DEPTH_D, DEPTH_FF = 0,0,0,0 #PID,feedforward param

#
node_cycle = 100.0
depth = 0.0
#counter = 0
lowerPublishCycle = 5
countThresh =  node_cycle / lowerPublishCycle

def getparam():
    global spd2frc_surge, spd2frc_sway, spd2frc_heave, spd2frc_pitch, spd2frc_roll, spd2frc_yaw
    global YAW_P, YAW_I, YAW_D, YAW_FF
    global ROLL_P, ROLL_I, ROLL_D, ROLL_FF
    global PITCH_P, PITCH_I, PITCH_D, PITCH_FF
    global DEPTH_P, DEPTH_I, DEPTH_D, DEPTH_FF
    spd2frc_surge = rospy.get_param("~spd2frc_surge",4.75)
    spd2frc_sway = rospy.get_param("~spd2frc_sway",49.5)
    spd2frc_heave = rospy.get_param("~spd2frc_heave",49.5)
    spd2frc_pitch = rospy.get_param("~spd2frc_pitch",5)
    spd2frc_roll = rospy.get_param("~spd2frc_roll",5)
    spd2frc_yaw = rospy.get_param("~spd2frc_yaw",5)
    
    YAW_FF  = rospy.get_param("~YAW_FF",1)
    YAW_P  = rospy.get_param("~YAW_P",1)
    YAW_I  = rospy.get_param("~YAW_I",0)
    YAW_D  = rospy.get_param("~YAW_D",0)

    ROLL_FF  = rospy.get_param("~ROLL_FF",0.1)
    ROLL_P  = rospy.get_param("~ROLL_P",0.)
    ROLL_I  = rospy.get_param("~ROLL_I",0)
    ROLL_D  = rospy.get_param("~ROLL_D",0)

    PITCH_FF  = rospy.get_param("~PITCH_FF",0.1)
    PITCH_P  = rospy.get_param("~PITCH_P",1)
    PITCH_I  = rospy.get_param("~PITCH_I",0)
    PITCH_D  = rospy.get_param("~PITCH_D",0)
    
    DEPTH_FF  = rospy.get_param("~DEPTH_FF",1)
    DEPTH_P  = rospy.get_param("~DEPTH_P",1)
    DEPTH_I  = rospy.get_param("~DEPTH_I",0)
    DEPTH_D  = rospy.get_param("~DEPTH_D",0)
    
    print("surge" + str(spd2frc_surge))
    print("sway" + str(spd2frc_sway))
def mode_callback(message):
    global mode
    if message.data == "Direct":
        mode = 0
    if message.data == "Stabilize":
        mode = 1
    if message.data == "DepthHold":
        mode = 2
    if message.data == "MultiAttitude":
        mode = 3
    print(mode)
def spd_callback(message):
    global twSpd
    twSpd = message
def imu_callback(message):
    global imu
    global vacc
    global vang
    global vangv
    imu = message
    vang = quatanion2eular(imu.orientation)
    _acc = np.dot(rm,[imu.linear_acceleration.x,imu.linear_acceleration.y,imu.linear_acceleration.z,1])
    vacc.x = _acc[0]
    vacc.y = _acc[1]
    vacc.z = _acc[2]
    _angv = np.dot(rm,[imu.angular_velocity.x,imu.angular_velocity.y,imu.angular_velocity.z,1])
    vangv.x = _angv[0]
    vangv.y = _angv[1]
    vangv.z = _angv[2]

def point_callback(message):
    global depth
    depth = message.z

def quatanion2eular(orientation):
    a = Vector3()
    q = tf.transformations.quaternion_multiply([orientation.x, orientation.y, orientation.z, orientation.w],posrm)
    e2 = tf.transformations.euler_from_quaternion((q[0], q[1], q[2], q[3]))
    if e2[0] > 0:
        a.x = e2[0] - math.pi
    else:
        a.x = e2[0] + math.pi
    a.y = e2[1] * -1
    a.z = e2[2] * -1
    return a
    
class controler:

    def __init__(self,kp,ki,kd,k_ff,_angular=False):
        self.kp = kp
        self.kd = kd
        self.ki = ki
        self.k_ff = k_ff
        self.acum = 0
        self._e = 0
        self.targetPos = 0
        self.angular = _angular

    def updatePID(self, target, current, dt):
        e = target - current
        self.acum  = self.acum + (e * dt)
        u = self.kp * e + self.kd * ((e - self._e) / dt) + self.acum * self.ki
        self._e = e
        return u

    def ff(self, current):
        if self.angular:
            if self.targetPos - current > (math.pi): 
                return ( self.targetPos - current - 2* math.pi) * self.k_ff
            elif self.targetPos - current < (-math.pi):
                return ( self.targetPos - current + 2* math.pi) * self.k_ff
            else:
                return ( self.targetPos - current ) * self.k_ff
        else:
            return ( self.targetPos - current ) * self.k_ff
    def reset(self):
        self.acum = 0
        self._e = 0

    def setTargetPos(self,target):
        self.targetPos = target

    def addTargetPos(self,value):
        self.targetPos = self.targetPos + value
        if self.angular:
            if self.targetPos > 2 * math.pi:
                self.targetPos = self.targetPos - 2 * math.pi
            elif self.targetPos < 0:
                self.targetPos = self.targetPos + 2 * math.pi

class stateEstimater:
    def __init__(self,value):
        self.last_depth = value
        self.velosity_heave = value
        self.f = 0.99
    def init(self):
        self.last_depth = 0
        self.last_depth
    def update(self,depth,dt):
        if self.last_depth == 0:
            self.last_depth = depth
        self.velosity_heave = self.f * self.velosity_heave + (1 - self.f) * (depth - self.last_depth) / dt
        self.last_depth = depth

def main():
    rospy.init_node("motion_controler")
    modeSub = rospy.Subscriber('mode', String,mode_callback)
    spdSub = rospy.Subscriber('twistSpd', Twist,spd_callback)
    posSub = rospy.Subscriber('Depth', Point,point_callback)
    imuSub = rospy.Subscriber('imu', Imu,imu_callback)
    FrcPub = rospy.Publisher('twistFrc',Twist,queue_size=1)
    eularPub = rospy.Publisher('vehicleAttitude',Vector3,queue_size=1)
    eularPub2 = rospy.Publisher('vehicleAngularVelosity',Vector3,queue_size=1)
    eularPub3 = rospy.Publisher('vehicleAcc',Vector3,queue_size=1)
    targetPosPub = rospy.Publisher('targetPos',Vector3,queue_size=1)
    targetAnglePub = rospy.Publisher('targetAngle',Vector3,queue_size=1)
    vehicleSpeedPub = rospy.Publisher('vehicleSpd',Vector3,queue_size=1)
    getparam()
    r = rospy.Rate(node_cycle)

    yawCon = controler(YAW_P,YAW_I,YAW_D,YAW_FF,_angular=True)
    rollCon = controler(ROLL_P,ROLL_I,ROLL_D,ROLL_FF,_angular=True)
    pitchCon = controler(PITCH_P,PITCH_I,PITCH_D,PITCH_FF,_angular=True)
    depthCon = controler(DEPTH_P,DEPTH_I,DEPTH_D,DEPTH_FF)
    
    vehicleState = stateEstimater(0)
    mode_catch = False
    counter = 0
    while not rospy.is_shutdown():
        #
        twFrc = Twist()
        vehicleState.update(depth,1 / node_cycle)

        if mode == 0:
            #print("Dict mode executing.")
            mode_catch = True
            twFrc.linear.x = twSpd.linear.x * abs(twSpd.linear.x) * spd2frc_surge
            twFrc.linear.y = twSpd.linear.y * abs(twSpd.linear.y) * spd2frc_sway
            twFrc.linear.z = twSpd.linear.z * abs(twSpd.linear.z) * spd2frc_heave
            twFrc.angular.z = twSpd.angular.z * spd2frc_yaw
        if mode == 1:
            mode_catch = True
            #print("Stability mode executing.")
            if mode != last_mode:
                rollCon.reset()
                pitchCon.reset()
                yawCon.reset()
                yawCon.setTargetPos(vang.z)
                pitchCon.setTargetPos(0)
                print("mode: " + str(mode) +", Controlers are reseted.")

            twFrc.linear.x = twSpd.linear.x * abs(twSpd.linear.x) * spd2frc_surge
            twFrc.linear.y = twSpd.linear.y * abs(twSpd.linear.y) * spd2frc_sway
            twFrc.linear.z = twSpd.linear.z * abs(twSpd.linear.z) * spd2frc_heave
            
            #yawCon.targetPos = yawCon.targetPos + twSpd.angular.z * (1 / node_cycle)
            yawCon.addTargetPos(twSpd.angular.z * (1 / node_cycle))
            #pitchCon.targetPos = -5
                 
            twFrc.angular.x = -1 * rollCon.updatePID(rollCon.ff(vang.x),vangv.x,(1 / node_cycle))
            twFrc.angular.y = pitchCon.updatePID(pitchCon.ff(vang.y),vangv.y,(1 / node_cycle))
            twFrc.angular.z = yawCon.updatePID(yawCon.ff(vang.z),vangv.z,(1 / node_cycle))
        if mode == 2:
            mode_catch = True
            #print("DepthHold mode executing.")
            if mode != last_mode:
                rollCon.reset()
                pitchCon.reset()
                yawCon.reset()
                depthCon.reset()
                yawCon.setTargetPos(vang.z)
                pitchCon.setTargetPos(0)
                depthCon.setTargetPos(depth)
                print("mode: " + str(mode) +", Controlers are reseted.")
            
            twFrc.linear.x = twSpd.linear.x * abs(twSpd.linear.x) * spd2frc_surge
            twFrc.linear.y = twSpd.linear.y * abs(twSpd.linear.y) * spd2frc_sway

            #yawCon.targetPos = yawCon.targetPos + twSpd.angular.z * (1 / node_cycle)
            yawCon.addTargetPos(twSpd.angular.z * (1 / node_cycle))
            #depthCon.targetPos = depthCon.targetPos + twSpd.linear.z * (1 / node_cycle)
            depthCon.addTargetPos(twSpd.linear.z / 10 * (1 / node_cycle))

            twFrc.linear.z = depthCon.updatePID(depthCon.ff(depth),vehicleState.velosity_heave,(1 / node_cycle))
            
            twFrc.angular.x = -1 * rollCon.updatePID(rollCon.ff(vang.x),vangv.x,(1 / node_cycle))
            twFrc.angular.y = pitchCon.updatePID(pitchCon.ff(vang.y),vangv.y,(1 / node_cycle))
            twFrc.angular.z = yawCon.updatePID(yawCon.ff(vang.z),vangv.z,(1 / node_cycle))
            #print(depthCon.targetPos)
            #print(depthCon.ff(depth))
            #print(depth)
            #print(twFrc.linear.z)
        if mode == 3:
            mode_catch = True
            if mode != last_mode:
                rollCon.reset()
                pitchCon.reset()
                yawCon.reset()
                yawCon.setTargetPos(vang.z)
                pitchCon.setTargetPos(-5)
                print("mode: " + str(mode) +", Controlers are reseted.")
            twFrc.linear.x = twSpd.linear.x * abs(twSpd.linear.x) * spd2frc_surge
            twFrc.linear.y = twSpd.linear.y * abs(twSpd.linear.y) * spd2frc_sway
            twFrc.linear.z = depthCon.updatePID(twSpd.linear.z / 3,vehicleState.velosity_heave,(1 / node_cycle))
            twFrc.angular.z = yawCon.updatePID(twSpd.angular.z / 3, vangv.z, (1 / node_cycle))
	    print(yawCon.acum)
        if mode_catch == False:
            print("Undefined control mode executing. Mode:=" + str(mode))
        
        last_mode = mode
        
        r.sleep()
        targetAngle.z = yawCon.targetPos
        targetPos.z = depthCon.targetPos
        vspd.z = vehicleState.velosity_heave
        FrcPub.publish(twFrc)
        #eularPub.publish(vang)
        #eularPub2.publish(vangv)
        eularPub3.publish(vacc)
        vehicleSpeedPub.publish(vspd)
        
        #low rate potics
        counter = counter + 1
        if counter == countThresh:
            eularPub.publish(vang)
            eularPub2.publish(vangv)
            eularPub3.publish(vacc)
            targetAnglePub.publish(targetAngle)
            targetPosPub.publish(targetPos)
            #vehicleSpeedPub.publish(vspd)
            counter = 0

   

if __name__ == "__main__":
    main()
