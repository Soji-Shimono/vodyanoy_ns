;; Auto-generated. Do not edit!


(when (boundp 'vehicle_msgs::ThrustersCommand)
  (if (not (find-package "VEHICLE_MSGS"))
    (make-package "VEHICLE_MSGS"))
  (shadow 'ThrustersCommand (find-package "VEHICLE_MSGS")))
(unless (find-package "VEHICLE_MSGS::THRUSTERSCOMMAND")
  (make-package "VEHICLE_MSGS::THRUSTERSCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude ThrustersCommand.msg.html


(defclass vehicle_msgs::ThrustersCommand
  :super ros::object
  :slots (_Thruster1 _Thruster2 _Thruster3 _Thruster4 _Thruster5 _Thruster6 _mode ))

(defmethod vehicle_msgs::ThrustersCommand
  (:init
   (&key
    ((:Thruster1 __Thruster1) (instance vehicle_msgs::ThrustCommand :init))
    ((:Thruster2 __Thruster2) (instance vehicle_msgs::ThrustCommand :init))
    ((:Thruster3 __Thruster3) (instance vehicle_msgs::ThrustCommand :init))
    ((:Thruster4 __Thruster4) (instance vehicle_msgs::ThrustCommand :init))
    ((:Thruster5 __Thruster5) (instance vehicle_msgs::ThrustCommand :init))
    ((:Thruster6 __Thruster6) (instance vehicle_msgs::ThrustCommand :init))
    ((:mode __mode) "")
    )
   (send-super :init)
   (setq _Thruster1 __Thruster1)
   (setq _Thruster2 __Thruster2)
   (setq _Thruster3 __Thruster3)
   (setq _Thruster4 __Thruster4)
   (setq _Thruster5 __Thruster5)
   (setq _Thruster6 __Thruster6)
   (setq _mode (string __mode))
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
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:serialization-length
   ()
   (+
    ;; vehicle_msgs/ThrustCommand _Thruster1
    (send _Thruster1 :serialization-length)
    ;; vehicle_msgs/ThrustCommand _Thruster2
    (send _Thruster2 :serialization-length)
    ;; vehicle_msgs/ThrustCommand _Thruster3
    (send _Thruster3 :serialization-length)
    ;; vehicle_msgs/ThrustCommand _Thruster4
    (send _Thruster4 :serialization-length)
    ;; vehicle_msgs/ThrustCommand _Thruster5
    (send _Thruster5 :serialization-length)
    ;; vehicle_msgs/ThrustCommand _Thruster6
    (send _Thruster6 :serialization-length)
    ;; string _mode
    4 (length _mode)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; vehicle_msgs/ThrustCommand _Thruster1
       (send _Thruster1 :serialize s)
     ;; vehicle_msgs/ThrustCommand _Thruster2
       (send _Thruster2 :serialize s)
     ;; vehicle_msgs/ThrustCommand _Thruster3
       (send _Thruster3 :serialize s)
     ;; vehicle_msgs/ThrustCommand _Thruster4
       (send _Thruster4 :serialize s)
     ;; vehicle_msgs/ThrustCommand _Thruster5
       (send _Thruster5 :serialize s)
     ;; vehicle_msgs/ThrustCommand _Thruster6
       (send _Thruster6 :serialize s)
     ;; string _mode
       (write-long (length _mode) s) (princ _mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; vehicle_msgs/ThrustCommand _Thruster1
     (send _Thruster1 :deserialize buf ptr-) (incf ptr- (send _Thruster1 :serialization-length))
   ;; vehicle_msgs/ThrustCommand _Thruster2
     (send _Thruster2 :deserialize buf ptr-) (incf ptr- (send _Thruster2 :serialization-length))
   ;; vehicle_msgs/ThrustCommand _Thruster3
     (send _Thruster3 :deserialize buf ptr-) (incf ptr- (send _Thruster3 :serialization-length))
   ;; vehicle_msgs/ThrustCommand _Thruster4
     (send _Thruster4 :deserialize buf ptr-) (incf ptr- (send _Thruster4 :serialization-length))
   ;; vehicle_msgs/ThrustCommand _Thruster5
     (send _Thruster5 :deserialize buf ptr-) (incf ptr- (send _Thruster5 :serialization-length))
   ;; vehicle_msgs/ThrustCommand _Thruster6
     (send _Thruster6 :deserialize buf ptr-) (incf ptr- (send _Thruster6 :serialization-length))
   ;; string _mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get vehicle_msgs::ThrustersCommand :md5sum-) "39aeea5206baf8dd8128d11e0a1a393a")
(setf (get vehicle_msgs::ThrustersCommand :datatype-) "vehicle_msgs/ThrustersCommand")
(setf (get vehicle_msgs::ThrustersCommand :definition-)
      "ThrustCommand Thruster1
ThrustCommand Thruster2
ThrustCommand Thruster3
ThrustCommand Thruster4
ThrustCommand Thruster5
ThrustCommand Thruster6
string        mode

================================================================================
MSG: vehicle_msgs/ThrustCommand
float64 rpm
float64 parsentage

")



(provide :vehicle_msgs/ThrustersCommand "39aeea5206baf8dd8128d11e0a1a393a")


