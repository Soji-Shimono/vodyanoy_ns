;; Auto-generated. Do not edit!


(when (boundp 'vehicle_msgs::ThrustState)
  (if (not (find-package "VEHICLE_MSGS"))
    (make-package "VEHICLE_MSGS"))
  (shadow 'ThrustState (find-package "VEHICLE_MSGS")))
(unless (find-package "VEHICLE_MSGS::THRUSTSTATE")
  (make-package "VEHICLE_MSGS::THRUSTSTATE"))

(in-package "ROS")
;;//! \htmlinclude ThrustState.msg.html


(defclass vehicle_msgs::ThrustState
  :super ros::object
  :slots (_rpm _force _valtage _wattage ))

(defmethod vehicle_msgs::ThrustState
  (:init
   (&key
    ((:rpm __rpm) 0.0)
    ((:force __force) 0.0)
    ((:valtage __valtage) 0.0)
    ((:wattage __wattage) 0.0)
    )
   (send-super :init)
   (setq _rpm (float __rpm))
   (setq _force (float __force))
   (setq _valtage (float __valtage))
   (setq _wattage (float __wattage))
   self)
  (:rpm
   (&optional __rpm)
   (if __rpm (setq _rpm __rpm)) _rpm)
  (:force
   (&optional __force)
   (if __force (setq _force __force)) _force)
  (:valtage
   (&optional __valtage)
   (if __valtage (setq _valtage __valtage)) _valtage)
  (:wattage
   (&optional __wattage)
   (if __wattage (setq _wattage __wattage)) _wattage)
  (:serialization-length
   ()
   (+
    ;; float64 _rpm
    8
    ;; float64 _force
    8
    ;; float64 _valtage
    8
    ;; float64 _wattage
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _rpm
       (sys::poke _rpm (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _force
       (sys::poke _force (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _valtage
       (sys::poke _valtage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wattage
       (sys::poke _wattage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _rpm
     (setq _rpm (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _force
     (setq _force (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _valtage
     (setq _valtage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wattage
     (setq _wattage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get vehicle_msgs::ThrustState :md5sum-) "af651f71f9d4dcc5b82ba1ba790dfa01")
(setf (get vehicle_msgs::ThrustState :datatype-) "vehicle_msgs/ThrustState")
(setf (get vehicle_msgs::ThrustState :definition-)
      "float64 rpm
float64 force
float64 valtage
float64 wattage

")



(provide :vehicle_msgs/ThrustState "af651f71f9d4dcc5b82ba1ba790dfa01")


