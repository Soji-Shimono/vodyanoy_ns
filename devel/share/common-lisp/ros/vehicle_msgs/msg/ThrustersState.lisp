; Auto-generated. Do not edit!


(cl:in-package vehicle_msgs-msg)


;//! \htmlinclude ThrustersState.msg.html

(cl:defclass <ThrustersState> (roslisp-msg-protocol:ros-message)
  ((Thruster1
    :reader Thruster1
    :initarg :Thruster1
    :type vehicle_msgs-msg:ThrustState
    :initform (cl:make-instance 'vehicle_msgs-msg:ThrustState))
   (Thruster2
    :reader Thruster2
    :initarg :Thruster2
    :type vehicle_msgs-msg:ThrustState
    :initform (cl:make-instance 'vehicle_msgs-msg:ThrustState))
   (Thruster3
    :reader Thruster3
    :initarg :Thruster3
    :type vehicle_msgs-msg:ThrustState
    :initform (cl:make-instance 'vehicle_msgs-msg:ThrustState))
   (Thruster4
    :reader Thruster4
    :initarg :Thruster4
    :type vehicle_msgs-msg:ThrustState
    :initform (cl:make-instance 'vehicle_msgs-msg:ThrustState))
   (Thruster5
    :reader Thruster5
    :initarg :Thruster5
    :type vehicle_msgs-msg:ThrustState
    :initform (cl:make-instance 'vehicle_msgs-msg:ThrustState))
   (Thruster6
    :reader Thruster6
    :initarg :Thruster6
    :type vehicle_msgs-msg:ThrustState
    :initform (cl:make-instance 'vehicle_msgs-msg:ThrustState)))
)

(cl:defclass ThrustersState (<ThrustersState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ThrustersState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ThrustersState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vehicle_msgs-msg:<ThrustersState> is deprecated: use vehicle_msgs-msg:ThrustersState instead.")))

(cl:ensure-generic-function 'Thruster1-val :lambda-list '(m))
(cl:defmethod Thruster1-val ((m <ThrustersState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Thruster1-val is deprecated.  Use vehicle_msgs-msg:Thruster1 instead.")
  (Thruster1 m))

(cl:ensure-generic-function 'Thruster2-val :lambda-list '(m))
(cl:defmethod Thruster2-val ((m <ThrustersState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Thruster2-val is deprecated.  Use vehicle_msgs-msg:Thruster2 instead.")
  (Thruster2 m))

(cl:ensure-generic-function 'Thruster3-val :lambda-list '(m))
(cl:defmethod Thruster3-val ((m <ThrustersState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Thruster3-val is deprecated.  Use vehicle_msgs-msg:Thruster3 instead.")
  (Thruster3 m))

(cl:ensure-generic-function 'Thruster4-val :lambda-list '(m))
(cl:defmethod Thruster4-val ((m <ThrustersState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Thruster4-val is deprecated.  Use vehicle_msgs-msg:Thruster4 instead.")
  (Thruster4 m))

(cl:ensure-generic-function 'Thruster5-val :lambda-list '(m))
(cl:defmethod Thruster5-val ((m <ThrustersState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Thruster5-val is deprecated.  Use vehicle_msgs-msg:Thruster5 instead.")
  (Thruster5 m))

(cl:ensure-generic-function 'Thruster6-val :lambda-list '(m))
(cl:defmethod Thruster6-val ((m <ThrustersState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Thruster6-val is deprecated.  Use vehicle_msgs-msg:Thruster6 instead.")
  (Thruster6 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ThrustersState>) ostream)
  "Serializes a message object of type '<ThrustersState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Thruster1) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Thruster2) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Thruster3) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Thruster4) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Thruster5) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Thruster6) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ThrustersState>) istream)
  "Deserializes a message object of type '<ThrustersState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Thruster1) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Thruster2) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Thruster3) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Thruster4) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Thruster5) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Thruster6) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ThrustersState>)))
  "Returns string type for a message object of type '<ThrustersState>"
  "vehicle_msgs/ThrustersState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ThrustersState)))
  "Returns string type for a message object of type 'ThrustersState"
  "vehicle_msgs/ThrustersState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ThrustersState>)))
  "Returns md5sum for a message object of type '<ThrustersState>"
  "0fe2acc0070e119df72824cb8968d31b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ThrustersState)))
  "Returns md5sum for a message object of type 'ThrustersState"
  "0fe2acc0070e119df72824cb8968d31b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ThrustersState>)))
  "Returns full string definition for message of type '<ThrustersState>"
  (cl:format cl:nil "ThrustState Thruster1~%ThrustState Thruster2~%ThrustState Thruster3~%ThrustState Thruster4~%ThrustState Thruster5~%ThrustState Thruster6~%~%================================================================================~%MSG: vehicle_msgs/ThrustState~%float64 rpm~%float64 force~%float64 valtage~%float64 wattage~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ThrustersState)))
  "Returns full string definition for message of type 'ThrustersState"
  (cl:format cl:nil "ThrustState Thruster1~%ThrustState Thruster2~%ThrustState Thruster3~%ThrustState Thruster4~%ThrustState Thruster5~%ThrustState Thruster6~%~%================================================================================~%MSG: vehicle_msgs/ThrustState~%float64 rpm~%float64 force~%float64 valtage~%float64 wattage~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ThrustersState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Thruster1))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Thruster2))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Thruster3))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Thruster4))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Thruster5))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Thruster6))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ThrustersState>))
  "Converts a ROS message object to a list"
  (cl:list 'ThrustersState
    (cl:cons ':Thruster1 (Thruster1 msg))
    (cl:cons ':Thruster2 (Thruster2 msg))
    (cl:cons ':Thruster3 (Thruster3 msg))
    (cl:cons ':Thruster4 (Thruster4 msg))
    (cl:cons ':Thruster5 (Thruster5 msg))
    (cl:cons ':Thruster6 (Thruster6 msg))
))
