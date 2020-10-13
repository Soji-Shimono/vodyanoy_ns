; Auto-generated. Do not edit!


(cl:in-package pt_msg-msg)


;//! \htmlinclude PanTiltAngles.msg.html

(cl:defclass <PanTiltAngles> (roslisp-msg-protocol:ros-message)
  ((pan
    :reader pan
    :initarg :pan
    :type cl:float
    :initform 0.0)
   (tilt
    :reader tilt
    :initarg :tilt
    :type cl:float
    :initform 0.0))
)

(cl:defclass PanTiltAngles (<PanTiltAngles>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PanTiltAngles>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PanTiltAngles)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pt_msg-msg:<PanTiltAngles> is deprecated: use pt_msg-msg:PanTiltAngles instead.")))

(cl:ensure-generic-function 'pan-val :lambda-list '(m))
(cl:defmethod pan-val ((m <PanTiltAngles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_msg-msg:pan-val is deprecated.  Use pt_msg-msg:pan instead.")
  (pan m))

(cl:ensure-generic-function 'tilt-val :lambda-list '(m))
(cl:defmethod tilt-val ((m <PanTiltAngles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_msg-msg:tilt-val is deprecated.  Use pt_msg-msg:tilt instead.")
  (tilt m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PanTiltAngles>) ostream)
  "Serializes a message object of type '<PanTiltAngles>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pan))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'tilt))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PanTiltAngles>) istream)
  "Deserializes a message object of type '<PanTiltAngles>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pan) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tilt) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PanTiltAngles>)))
  "Returns string type for a message object of type '<PanTiltAngles>"
  "pt_msg/PanTiltAngles")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PanTiltAngles)))
  "Returns string type for a message object of type 'PanTiltAngles"
  "pt_msg/PanTiltAngles")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PanTiltAngles>)))
  "Returns md5sum for a message object of type '<PanTiltAngles>"
  "da61f3d6b381bd4af7a066f22fdfa441")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PanTiltAngles)))
  "Returns md5sum for a message object of type 'PanTiltAngles"
  "da61f3d6b381bd4af7a066f22fdfa441")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PanTiltAngles>)))
  "Returns full string definition for message of type '<PanTiltAngles>"
  (cl:format cl:nil "float64 pan~%float64 tilt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PanTiltAngles)))
  "Returns full string definition for message of type 'PanTiltAngles"
  (cl:format cl:nil "float64 pan~%float64 tilt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PanTiltAngles>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PanTiltAngles>))
  "Converts a ROS message object to a list"
  (cl:list 'PanTiltAngles
    (cl:cons ':pan (pan msg))
    (cl:cons ':tilt (tilt msg))
))
