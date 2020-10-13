;; Auto-generated. Do not edit!


(when (boundp 'vehicle_msgs::ThrustersState)
  (if (not (find-package "VEHICLE_MSGS"))
    (make-package "VEHICLE_MSGS"))
  (shadow 'ThrustersState (find-package "VEHICLE_MSGS")))
(unless (find-package "VEHICLE_MSGS::THRUSTERSSTATE")
  (make-package "VEHICLE_MSGS::THRUSTERSSTATE"))

(in-package "ROS")
;;//! \htmlinclude ThrustersState.msg.html


(defclass vehicle_msgs::ThrustersState
  :super ros::object
  :slots (_Thruster1 _Thruster2 _Thruster3 _Thruster4 _Thruster5 _Thruster6 ))

(defmethod vehicle_msgs::ThrustersState
  (:init
   (&key
    ((:Thruster1 __Thruster1) (instance vehicle_msgs::ThrustState :init))
    ((:Thruster2 __Thruster2) (instance vehicle_msgs::ThrustState :init))
    ((:Thruster3 __Thruster3) (instance vehicle_msgs::ThrustState :init))
    ((:Thruster4 __Thruster4) (instance vehicle_msgs::ThrustState :init))
    ((:Thruster5 __Thruster5) (instance vehicle_msgs::ThrustState :init))
    ((:Thruster6 __Thruster6) (instance vehicle_msgs::ThrustState :init))
    )
   (send-super :init)
   (setq _Thruster1 __Thruster1)
   (setq _Thruster2 __Thruster2)
   (setq _Thruster3 __Thruster3)
   (setq _Thruster4 __Thruster4)
   (setq _Thruster5 __Thruster5)
   (setq _Thruster6 __Thruster6)
   self)
  (:Thruster1
   (&rest __Thruster1)
   (if (keywordp (car __Thruster1))
       (send* _Thruster1 __Thruster1)
     (progn
       (if __Thruster1 (setq _Thruster1 (car __Thruster1)))
       _Thruster1)))
  (:Thruster2
   (&rest __Thruster2)
   (if (keywordp (car __Thruster2))
       (send* _Thruster2 __Thruster2)
     (progn
       (if __Thruster2 (setq _Thruster2 (car __Thruster2)))
       _Thruster2)))
  (:Thruster3
   (&rest __Thruster3)
   (if (keywordp (car __Thruster3))
       (send* _Thruster3 __Thruster3)
     (progn
       (if __Thruster3 (setq _Thruster3 (car __Thruster3)))
       _Thruster3)))
  (:Thruster4
   (&rest __Thruster4)
   (if (keywordp (car __Thruster4))
       (send* _Thruster4 __Thruster4)
     (progn
       (if __Thruster4 (setq _Thruster4 (car __Thruster4)))
       _Thruster4)))
  (:Thruster5
   (&rest __Thruster5)
   (if (keywordp (car __Thruster5))
       (send* _Thruster5 __Thruster5)
     (progn
       (if __Thruster5 (setq _Thruster5 (car __Thruster5)))
       _Thruster5)))
  (:Thruster6
   (&rest __Thruster6)
   (if (keywordp (car __Thruster6))
       (send* _Thruster6 __Thruster6)
     (progn
       (if __Thruster6 (setq _Thruster6 (car __Thruster6)))
       _Thruster6)))
  (:serialization-length
   ()
   (+
    ;; vehicle_msgs/ThrustState _Thruster1
    (send _Thruster1 :serialization-length)
    ;; vehicle_msgs/ThrustState _Thruster2
    (send _Thruster2 :serialization-length)
    ;; vehicle_msgs/ThrustState _Thruster3
    (send _Thruster3 :serialization-length)
    ;; vehicle_msgs/ThrustState _Thruster4
    (send _Thruster4 :serialization-length)
    ;; vehicle_msgs/ThrustState _Thruster5
    (send _Thruster5 :serialization-length)
    ;; vehicle_msgs/ThrustState _Thruster6
    (send _Thruster6 :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; vehicle_msgs/ThrustState _Thruster1
       (send _Thruster1 :serialize s)
     ;; vehicle_msgs/ThrustState _Thruster2
       (send _Thruster2 :serialize s)
     ;; vehicle_msgs/ThrustState _Thruster3
       (send _Thruster3 :serialize s)
     ;; vehicle_msgs/ThrustState _Thruster4
       (send _Thruster4 :serialize s)
     ;; vehicle_msgs/ThrustState _Thruster5
       (send _Thruster5 :serialize s)
     ;; vehicle_msgs/ThrustState _Thruster6
       (send _Thruster6 :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; vehicle_msgs/ThrustState _Thruster1
     (send _Thruster1 :deserialize buf ptr-) (incf ptr- (send _Thruster1 :serialization-length))
   ;; vehicle_msgs/ThrustState _Thruster2
     (send _Thruster2 :deserialize buf ptr-) (incf ptr- (send _Thruster2 :serialization-length))
   ;; vehicle_msgs/ThrustState _Thruster3
     (send _Thruster3 :deserialize buf ptr-) (incf ptr- (send _Thruster3 :serialization-length))
   ;; vehicle_msgs/ThrustState _Thruster4
     (send _Thruster4 :deserialize buf ptr-) (incf ptr- (send _Thruster4 :serialization-length))
   ;; vehicle_msgs/ThrustState _Thruster5
     (send _Thruster5 :deserialize buf ptr-) (incf ptr- (send _Thruster5 :serialization-length))
   ;; vehicle_msgs/ThrustState _Thruster6
     (send _Thruster6 :deserialize buf ptr-) (incf ptr- (send _Thruster6 :serialization-length))
   ;;
   self)
  )

(setf (get vehicle_msgs::ThrustersState :md5sum-) "0fe2acc0070e119df72824cb8968d31b")
(setf (get vehicle_msgs::ThrustersState :datatype-) "vehicle_msgs/ThrustersState")
(setf (get vehicle_msgs::ThrustersState :definition-)
      "ThrustState Thruster1
ThrustState Thruster2
ThrustState Thruster3
ThrustState Thruster4
ThrustState Thruster5
ThrustState Thruster6

================================================================================
MSG: vehicle_msgs/ThrustState
float64 rpm
float64 force
float64 valtage
float64 wattage

")



(provide :vehicle_msgs/ThrustersState "0fe2acc0070e119df72824cb8968d31b")


