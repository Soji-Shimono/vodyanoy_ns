;; Auto-generated. Do not edit!


(when (boundp 'vehicle_msgs::ThrustCommand)
  (if (not (find-package "VEHICLE_MSGS"))
    (make-package "VEHICLE_MSGS"))
  (shadow 'ThrustCommand (find-package "VEHICLE_MSGS")))
(unless (find-package "VEHICLE_MSGS::THRUSTCOMMAND")
  (make-package "VEHICLE_MSGS::THRUSTCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude ThrustCommand.msg.html


(defclass vehicle_msgs::ThrustCommand
  :super ros::object
  :slots (_rpm _parsentage ))

(defmethod vehicle_msgs::ThrustCommand
  (:init
   (&key
    ((:rpm __rpm) 0.0)
    ((:parsentage __parsentage) 0.0)
    )
   (send-super :init)
   (setq _rpm (float __rpm))
   (setq _parsentage (float __parsentage))
   self)
  (:rpm
   (&optional __rpm)
   (if __rpm (setq _rpm __rpm)) _rpm)
  (:parsentage
   (&optional __parsentage)
   (if __parsentage (setq _parsentage __parsentage)) _parsentage)
  (:serialization-length
   ()
   (+
    ;; float64 _rpm
    8
    ;; float64 _parsentage
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _rpm
       (sys::poke _rpm (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _parsentage
       (sys::poke _parsentage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _rpm
     (setq _rpm (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _parsentage
     (setq _parsentage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get vehicle_msgs::ThrustCommand :md5sum-) "1ddf5f4cc143c036adb2fabd0af5bfc0")
(setf (get vehicle_msgs::ThrustCommand :datatype-) "vehicle_msgs/ThrustCommand")
(setf (get vehicle_msgs::ThrustCommand :definition-)
      "float64 rpm
float64 parsentage

")



(provide :vehicle_msgs/ThrustCommand "1ddf5f4cc143c036adb2fabd0af5bfc0")


