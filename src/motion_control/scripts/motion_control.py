#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from sensor_msgs.msg import Imu
from geometry_msgs.msg import Twist

mode = 0
twSpd = Twist()
#param
spd2frc_surge, spd2frc_sway, spd2frc_heave = 0,0,0 #[kg/m]
spd2frc_pitch, spd2frc_roll, spd2frc_yaw = 0,0,0 #[Nm/s]
YAW_P, YAW_I, YAW_D, YAW_FF = 0,0,0,0 #PID,feedforward param
node_cycle = 10.0

def getparam():
    global spd2frc_surge, spd2frc_sway, spd2frc_heave, spd2frc_pitch, spd2frc_roll, spd2frc_yaw
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

class controler:
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

def main():
    rospy.init_node("motion_controler")
    modeSub = rospy.Subscriber('mode', String,mode_callback)
    spdSub = rospy.Subscriber('twistSpd', Twist,spd_callback)
    FrcPub = rospy.Publisher('twistFrc',Twist,queue_size=10)
    getparam()
    r = rospy.Rate(node_cycle)

    yawCon = controler()
    rollCon = controler()
    pitchCon = controler()
    yawCon.init(YAW_P,YAW_I,YAW_D,YAW_FF)
    rollCon.init(ROLL_P,ROLL_I,ROLL_D,ROLL_FF)
    pitchCon.init(PITCH_P,PITCH_I,PITCH_D,PITCH_FF)
    
    
    while not rospy.is_shutdown():
        #
        twFrc = Twist()
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

            twFrc.angular.z = yawCon.updatePID(yawCon.ff(0,?YawAngle),?YawVelosity,(1 / node_cycle))

        else:
            print("Rate control mode executing.")
        r.sleep()
        FrcPub.publish(twFrc)

   

if __name__ == "__main__":
    main()