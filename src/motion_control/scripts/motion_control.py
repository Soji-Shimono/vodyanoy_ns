#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from sensor_msgs.msg import Imu
from geometry_msgs.msg import Twist
import math
from geometry_msgs.msg import Point

mode = 0
twSpd = Twist()
imu = Imu()
pitch, roll, yaw = 0,0,0
#param
spd2frc_surge, spd2frc_sway, spd2frc_heave = 0,0,0 #[kg/m]
spd2frc_pitch, spd2frc_roll, spd2frc_yaw = 0,0,0 #[Nm/s]
YAW_P, YAW_I, YAW_D, YAW_FF = 0,0,0,0 #PID,feedforward param
ROLL_P, ROLL_I, ROLL_D, ROLL_FF = 0,0,0,0 #PID,feedforward param
PITCH_P, PITCH_I, PITCH_D, PITCH_FF = 0,0,0,0 #PID,feedforward param
DEPTH_P, DEPTH_I, DEPTH_D, DEPTH_FF = 0,0,0,0 #PID,feedforward param
node_cycle = 10.0
depth = 0

def getparam():
    global spd2frc_surge, spd2frc_sway, spd2frc_heave, spd2frc_pitch, spd2frc_roll, spd2frc_yaw
    global YAW_P, YAW_I, YAW_D, YAW_FF
    global ROLL_P, ROLL_I, ROLL_D, ROLL_FF
    global PITCH_P, PITCH_I, PITCH_D, PITCH_FF

    spd2frc_surge = rospy.get_param("~spd2frc_surge",1)
    spd2frc_sway = rospy.get_param("~spd2frc_sway",1)
    spd2frc_heave = rospy.get_param("~spd2frc_heave",1)
    spd2frc_pitch = rospy.get_param("~spd2frc_pitch",1)
    spd2frc_roll = rospy.get_param("~spd2frc_roll",1)
    spd2frc_yaw = rospy.get_param("~spd2frc_yaw",1)
    YAW_P  = rospy.get_param("~YAW_P",1)
    YAW_I  = rospy.get_param("~YAW_I",1)
    YAW_D  = rospy.get_param("~YAW_D",1)
    YAW_FF  = rospy.get_param("~YAW_FF",1)
    ROLL_P  = rospy.get_param("~ROLL_P",1)
    ROLL_I  = rospy.get_param("~ROLL_I",1)
    ROLL_D  = rospy.get_param("~ROLL_D",1)
    ROLL_FF  = rospy.get_param("~ROLL_FF",1)
    PITCH_P  = rospy.get_param("~PITCH_P",1)
    PITCH_I  = rospy.get_param("~PITCH_I",1)
    PITCH_D  = rospy.get_param("~PITCH_D",1)
    PITCH_FF  = rospy.get_param("~PITCH_FF",1)
    DEPTH_P  = rospy.get_param("~DEPTH_P",1)
    DEPTH_I  = rospy.get_param("~DEPTH_I",1)
    DEPTH_D  = rospy.get_param("~DEPTH_D",1)
    DEPTH_FF  = rospy.get_param("~DEPTH_FF",1)
    
    print("surge" + str(spd2frc_surge))
    print("sway" + str(spd2frc_sway))
def mode_callback(message):
    global mode
    if message.data == "Direct":
        mode = 0
    if message,data == "Stabilize":
        mode = 1
    if message,data == "DepthHold":
        mode = 2
    if message,data == "MultiAttitude":
        mode = 3
    print(mode)
def spd_callback(message):
    global twSpd
    twSpd = message
def imu_callback(message):
    global imu
    global pitch, roll, yaw
    imu = message
    pitch, roll, yaw = quatanion2eular(imu)
def point_callback(message):
    global depth
    depth = message.z
def quatanion2eular(imu):
    q0 = imu.orientation[0]
    q1 = imu.orientation[1]
    q2 = imu.orientation[2]
    q3 = imu.orientation[3]
    roll = math.atan(2 * (q0 * q1 + q2 * q3 ) / (math.pow(q0,2) - math.pow(q1,2) - math.pow(q2,2) + math.pow(q3,2)))
    pitch = math.asin( 2 * (q0 * q2 - q1 * q3))
    yaw = math.atan(2 * (q0 * q3 + q1 * q2 ) / (math.pow(q0,2) + math.pow(q1,2) - math.pow(q2,2) - math.pow(q3,2)))
    return roll, pitch, yaw
class controler:
    targetPos = 0
    kp = 1
    kd = 0
    ki = 0
    acum = 0
    _e = 0
    k_ff = 1

    def updatePID(self, target, current, dt):
        e = target - current
        acum  = acum + (e * dt)
        u = kp * e + kd * ((e - _e) / dt) + acum * ki
        _e = e
        return u

    def ff(self, target, current):
        return ( target - current ) * k_ff

    def init(self,p,d,i,ff):
        kp = p
        kd = d
        ki = i
        acum = 0
        k_ff = ff
class stateEstimater:
    velosity_heave = 0
    last_depth = 0
    def init():
        velosity_heave = 0
    last_depth = 0
    def update(self,depth,dt):
        if last_depth = 0:
            last_depth = depth
        velosity_heave = (depth - last_depth) / dt
        last_depth = depth

def main():
    rospy.init_node("motion_controler")
    modeSub = rospy.Subscriber('mode', String,mode_callback)
    spdSub = rospy.Subscriber('twistSpd', Twist,spd_callback)
    posSub = rospy.Subscriber('Depth', Point,point_callback)
    FrcPub = rospy.Publisher('twistFrc',Twist,queue_size=10)
    getparam()
    r = rospy.Rate(node_cycle)

    yawCon = controler()
    rollCon = controler()
    pitchCon = controler()
    depthCon = controler()
    yawCon.init(YAW_P,YAW_I,YAW_D,YAW_FF)
    rollCon.init(ROLL_P,ROLL_I,ROLL_D,ROLL_FF)
    pitchCon.init(PITCH_P,PITCH_I,PITCH_D,PITCH_FF)
    depthCon.init(DEPTH_P,DEPTH_I,DEPTH_D,DEPTH_FF)
    
    vehicleState = stateEstimater()

    while not rospy.is_shutdown():
        #
        twFrc = Twist()
        vehicleState.update(depth,1 / node_cycle)

        if mode == 0:
            #print("Dict mode executing.")
            twFrc.linear.x = twSpd.linear.x * math.abs(twSpd.linear.x) * spd2frc_surge
            twFrc.linear.y = twSpd.linear.y * math.abs(twSpd.linear.y) * spd2frc_sway
            twFrc.linear.z = twSpd.linear.z * math.abs(twSpd.linear.z) * spd2frc_heave
            twFrc.angular.z = twSpd.angular.z * spd2frc_yaw
        if mode == 1:
            #print("Stability mode executing.")
            twFrc.linear.x = twSpd.linear.x * math.abs(twSpd.linear.x) * spd2frc_surge
            twFrc.linear.y = twSpd.linear.y * math.abs(twSpd.linear.y) * spd2frc_sway
            twFrc.linear.z = twSpd.linear.z * math.abs(twSpd.linear.z) * spd2frc_heave
            
            yawCon.targetPos = yawCon.targetPos + twSpd.angular.z * (1 / node_cycle)
                
            twFrc.angular.x = rollCon.updatePID(rollCon.ff(0,roll),imu.angular_velocity[0],(1 / node_cycle))
            twFrc.angular.y = pitchCon.updatePID(pitchCon.ff(0,pitch),imu.angular_velocity[1],(1 / node_cycle))
            twFrc.angular.z = yawCon.updatePID(yawCon.ff(yawCon.targetPos,yaw),imu.angular_velocity[2],(1 / node_cycle))
        if mode == 2:
            #print("DepthHold mode executing.")
            twFrc.linear.x = twSpd.linear.x * math.abs(twSpd.linear.x) * spd2frc_surge
            twFrc.linear.y = twSpd.linear.y * math.abs(twSpd.linear.y) * spd2frc_sway

            yawCon.targetPos = yawCon.targetPos + twSpd.angular.z * (1 / node_cycle)
            depthCon.targetPos = depthCon.targetPos + twSpd.linear.z * (1 / node_cycle)

            twFrc.linear.z = yawCon.updatePID(depthCon.ff(depthCon.targetPos,depth),vehicleState.velosity_heave,(1 / node_cycle))
            twFrc.angular.x = rollCon.updatePID(rollCon.ff(0,roll),imu.angular_velocity[0],(1 / node_cycle))
            twFrc.angular.y = pitchCon.updatePID(pitchCon.ff(0,pitch),imu.angular_velocity[1],(1 / node_cycle))
            twFrc.angular.z = yawCon.updatePID(yawCon.ff(yawCon.targetPos,yaw),imu.angular_velocity[2],(1 / node_cycle))
        if mode == 3:
            #print("MultiAttitude mode executing.")




        else:
            print("Undefined control mode executing.")
        r.sleep()
        FrcPub.publish(twFrc)

   

if __name__ == "__main__":
    main()