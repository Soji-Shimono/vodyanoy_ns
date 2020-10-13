; Auto-generated. Do not edit!


(cl:in-package vehicle_msgs-msg)


;//! \htmlinclude ThrustersCommand.msg.html

(cl:defclass <ThrustersCommand> (roslisp-msg-protocol:ros-message)
  ((Thruster1
    :reader Thruster1
    :initarg :Thruster1
    :type vehicle_msgs-msg:ThrustCommand
    :initform (cl:make-instance 'vehicle_msgs-msg:ThrustCommand))
   (Thruster2
    :reader Thruster2
    :initarg :Thruster2
    :type vehicle_msgs-msg:ThrustCommand
    :initform (cl:make-instance 'vehicle_msgs-msg:ThrustCommand))
   (Thruster3
    :reader Thruster3
    :initarg :Thruster3
    :type vehicle_msgs-msg:ThrustCommand
    :initform (cl:make-instance 'vehicle_msgs-msg:ThrustCommand))
   (Thruster4
    :reader Thruster4
    :initarg :Thruster4
    :type vehicle_msgs-msg:ThrustCommand
    :initform (cl:make-instance 'vehicle_msgs-msg:ThrustCommand))
   (Thruster5
    :reader Thruster5
    :initarg :Thruster5
    :type vehicle_msgs-msg:ThrustCommand
    :initform (cl:make-instance 'vehicle_msgs-msg:ThrustCommand))
   (Thruster6
    :reader Thruster6
    :initarg :Thruster6
    :type vehicle_msgs-msg:ThrustCommand
    :initform (cl:make-instance 'vehicle_msgs-msg:ThrustCommand))
   (mode
    :reader mode
    :initarg :mode
    :type cl:string
    :initform ""))
)

(cl:defclass ThrustersCommand (<ThrustersCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ThrustersCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ThrustersCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vehicle_msgs-msg:<ThrustersCommand> is deprecated: use vehicle_msgs-msg:ThrustersCommand instead.")))

(cl:ensure-generic-function 'Thruster1-val :lambda-list '(m))
(cl:defmethod Thruster1-val ((m <ThrustersCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Thruster1-val is deprecated.  Use vehicle_msgs-msg:Thruster1 instead.")
  (Thruster1 m))

(cl:ensure-generic-function 'Thruster2-val :lambda-list '(m))
(cl:defmethod Thruster2-val ((m <ThrustersCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Thruster2-val is deprecated.  Use vehicle_msgs-msg:Thruster2 instead.")
  (Thruster2 m))

(cl:ensure-generic-function 'Thruster3-val :lambda-list '(m))
(cl:defmethod Thruster3-val ((m <ThrustersCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Thruster3-val is deprecated.  Use vehicle_msgs-msg:Thruster3 instead.")
  (Thruster3 m))

(cl:ensure-generic-function 'Thruster4-val :lambda-list '(m))
(cl:defmethod Thruster4-val ((m <ThrustersCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Thruster4-val is deprecated.  Use vehicle_msgs-msg:Thruster4 instead.")
  (Thruster4 m))

(cl:ensure-generic-function 'Thruster5-val :lambda-list '(m))
(cl:defmethod Thruster5-val ((m <ThrustersCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Thruster5-val is deprecated.  Use vehicle_msgs-msg:Thruster5 instead.")
  (Thruster5 m))

(cl:ensure-generic-function 'Thruster6-val :lambda-list '(m))
(cl:defmethod Thruster6-val ((m <ThrustersCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:Thruster6-val is deprecated.  Use vehicle_msgs-msg:Thruster6 instead.")
  (Thruster6 m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <ThrustersCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:mode-val is deprecated.  Use vehicle_msgs-msg:mode instead.")
  (mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ThrustersCommand>) ostream)
  "Serializes a message object of type '<ThrustersCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Thruster1) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Thruster2) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Thruster3) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Thruster4) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Thruster5) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Thruster6) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mode))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ThrustersCommand>) istream)
  "Deserializes a message object of type '<ThrustersCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Thruster1) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Thruster2) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Thruster3) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Thruster4) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Thruster5) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Thruster6) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ThrustersCommand>)))
  "Returns string type for a message object of type '<ThrustersCommand>"
  "vehicle_msgs/ThrustersCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ThrustersCommand)))
  "Returns string type for a message object of type 'ThrustersCommand"
  "vehicle_msgs/ThrustersCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ThrustersCommand>)))
  "Returns md5sum for a message object of type '<ThrustersCommand>"
  "39aeea5206baf8dd8128d11e0a1a393a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ThrustersCommand)))
  "Returns md5sum for a message object of type 'ThrustersCommand"
  "39aeea5206baf8dd8128d11e0a1a393a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ThrustersCommand>)))
  "Returns full string definition for message of type '<ThrustersCommand>"
  (cl:format cl:nil "ThrustCommand Thruster1~%ThrustCommand Thruster2~%ThrustCommand Thruster3~%ThrustCommand Thruster4~%ThrustCommand Thruster5~%ThrustCommand Thruster6~%string        mode~%~%================================================================================~%MSG: vehicle_msgs/ThrustCommand~%float64 rpm~%float64 parsentage~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ThrustersCommand)))
  "Returns full string definition for message of type 'ThrustersCommand"
  (cl:format cl:nil "ThrustCommand Thruster1~%ThrustCommand Thruster2~%ThrustCommand Thruster3~%ThrustCommand Thruster4~%ThrustCommand Thruster5~%ThrustCommand Thruster6~%string        mode~%~%================================================================================~%MSG: vehicle_msgs/ThrustCommand~%float64 rpm~%float64 parsentage~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ThrustersCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Thruster1))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Thruster2))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Thruster3))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Thruster4))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Thruster5))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Thruster6))
     4 (cl:length (cl:slot-value msg 'mode))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ThrustersCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'ThrustersCommand
    (cl:cons ':Thruster1 (Thruster1 msg))
    (cl:cons ':Thruster2 (Thruster2 msg))
    (cl:cons ':Thruster3 (Thruster3 msg))
    (cl:cons ':Thruster4 (Thruster4 msg))
    (cl:cons ':Thruster5 (Thruster5 msg))
    (cl:cons ':Thruster6 (Thruster6 msg))
    (cl:cons ':mode (mode msg))
))
