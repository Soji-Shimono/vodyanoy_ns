; Auto-generated. Do not edit!


(cl:in-package vehicle_msgs-msg)


;//! \htmlinclude ThrustCommand.msg.html

(cl:defclass <ThrustCommand> (roslisp-msg-protocol:ros-message)
  ((rpm
    :reader rpm
    :initarg :rpm
    :type cl:float
    :initform 0.0)
   (parsentage
    :reader parsentage
    :initarg :parsentage
    :type cl:float
    :initform 0.0))
)

(cl:defclass ThrustCommand (<ThrustCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ThrustCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ThrustCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vehicle_msgs-msg:<ThrustCommand> is deprecated: use vehicle_msgs-msg:ThrustCommand instead.")))

(cl:ensure-generic-function 'rpm-val :lambda-list '(m))
(cl:defmethod rpm-val ((m <ThrustCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:rpm-val is deprecated.  Use vehicle_msgs-msg:rpm instead.")
  (rpm m))

(cl:ensure-generic-function 'parsentage-val :lambda-list '(m))
(cl:defmethod parsentage-val ((m <ThrustCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:parsentage-val is deprecated.  Use vehicle_msgs-msg:parsentage instead.")
  (parsentage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ThrustCommand>) ostream)
  "Serializes a message object of type '<ThrustCommand>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'rpm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'parsentage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ThrustCommand>) istream)
  "Deserializes a message object of type '<ThrustCommand>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rpm) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'parsentage) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ThrustCommand>)))
  "Returns string type for a message object of type '<ThrustCommand>"
  "vehicle_msgs/ThrustCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ThrustCommand)))
  "Returns string type for a message object of type 'ThrustCommand"
  "vehicle_msgs/ThrustCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ThrustCommand>)))
  "Returns md5sum for a message object of type '<ThrustCommand>"
  "1ddf5f4cc143c036adb2fabd0af5bfc0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ThrustCommand)))
  "Returns md5sum for a message object of type 'ThrustCommand"
  "1ddf5f4cc143c036adb2fabd0af5bfc0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ThrustCommand>)))
  "Returns full string definition for message of type '<ThrustCommand>"
  (cl:format cl:nil "float64 rpm~%float64 parsentage~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ThrustCommand)))
  "Returns full string definition for message of type 'ThrustCommand"
  (cl:format cl:nil "float64 rpm~%float64 parsentage~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ThrustCommand>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ThrustCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'ThrustCommand
    (cl:cons ':rpm (rpm msg))
    (cl:cons ':parsentage (parsentage msg))
))
