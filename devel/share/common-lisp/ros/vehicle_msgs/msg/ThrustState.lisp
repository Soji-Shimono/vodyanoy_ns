; Auto-generated. Do not edit!


(cl:in-package vehicle_msgs-msg)


;//! \htmlinclude ThrustState.msg.html

(cl:defclass <ThrustState> (roslisp-msg-protocol:ros-message)
  ((rpm
    :reader rpm
    :initarg :rpm
    :type cl:float
    :initform 0.0)
   (force
    :reader force
    :initarg :force
    :type cl:float
    :initform 0.0)
   (valtage
    :reader valtage
    :initarg :valtage
    :type cl:float
    :initform 0.0)
   (wattage
    :reader wattage
    :initarg :wattage
    :type cl:float
    :initform 0.0))
)

(cl:defclass ThrustState (<ThrustState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ThrustState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ThrustState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vehicle_msgs-msg:<ThrustState> is deprecated: use vehicle_msgs-msg:ThrustState instead.")))

(cl:ensure-generic-function 'rpm-val :lambda-list '(m))
(cl:defmethod rpm-val ((m <ThrustState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:rpm-val is deprecated.  Use vehicle_msgs-msg:rpm instead.")
  (rpm m))

(cl:ensure-generic-function 'force-val :lambda-list '(m))
(cl:defmethod force-val ((m <ThrustState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:force-val is deprecated.  Use vehicle_msgs-msg:force instead.")
  (force m))

(cl:ensure-generic-function 'valtage-val :lambda-list '(m))
(cl:defmethod valtage-val ((m <ThrustState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:valtage-val is deprecated.  Use vehicle_msgs-msg:valtage instead.")
  (valtage m))

(cl:ensure-generic-function 'wattage-val :lambda-list '(m))
(cl:defmethod wattage-val ((m <ThrustState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vehicle_msgs-msg:wattage-val is deprecated.  Use vehicle_msgs-msg:wattage instead.")
  (wattage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ThrustState>) ostream)
  "Serializes a message object of type '<ThrustState>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'rpm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'force))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'valtage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wattage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ThrustState>) istream)
  "Deserializes a message object of type '<ThrustState>"
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
    (cl:setf (cl:slot-value msg 'force) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'valtage) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wattage) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ThrustState>)))
  "Returns string type for a message object of type '<ThrustState>"
  "vehicle_msgs/ThrustState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ThrustState)))
  "Returns string type for a message object of type 'ThrustState"
  "vehicle_msgs/ThrustState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ThrustState>)))
  "Returns md5sum for a message object of type '<ThrustState>"
  "af651f71f9d4dcc5b82ba1ba790dfa01")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ThrustState)))
  "Returns md5sum for a message object of type 'ThrustState"
  "af651f71f9d4dcc5b82ba1ba790dfa01")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ThrustState>)))
  "Returns full string definition for message of type '<ThrustState>"
  (cl:format cl:nil "float64 rpm~%float64 force~%float64 valtage~%float64 wattage~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ThrustState)))
  "Returns full string definition for message of type 'ThrustState"
  (cl:format cl:nil "float64 rpm~%float64 force~%float64 valtage~%float64 wattage~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ThrustState>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ThrustState>))
  "Converts a ROS message object to a list"
  (cl:list 'ThrustState
    (cl:cons ':rpm (rpm msg))
    (cl:cons ':force (force msg))
    (cl:cons ':valtage (valtage msg))
    (cl:cons ':wattage (wattage msg))
))
