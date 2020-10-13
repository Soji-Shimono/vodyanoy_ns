;; Auto-generated. Do not edit!


(when (boundp 'pt_msg::PanTiltAngles)
  (if (not (find-package "PT_MSG"))
    (make-package "PT_MSG"))
  (shadow 'PanTiltAngles (find-package "PT_MSG")))
(unless (find-package "PT_MSG::PANTILTANGLES")
  (make-package "PT_MSG::PANTILTANGLES"))

(in-package "ROS")
;;//! \htmlinclude PanTiltAngles.msg.html


(defclass pt_msg::PanTiltAngles
  :super ros::object
  :slots (_pan _tilt ))

(defmethod pt_msg::PanTiltAngles
  (:init
   (&key
    ((:pan __pan) 0.0)
    ((:tilt __tilt) 0.0)
    )
   (send-super :init)
   (setq _pan (float __pan))
   (setq _tilt (float __tilt))
   self)
  (:pan
   (&optional __pan)
   (if __pan (setq _pan __pan)) _pan)
  (:tilt
   (&optional __tilt)
   (if __tilt (setq _tilt __tilt)) _tilt)
  (:serialization-length
   ()
   (+
    ;; float64 _pan
    8
    ;; float64 _tilt
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _pan
       (sys::poke _pan (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _tilt
       (sys::poke _tilt (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _pan
     (setq _pan (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _tilt
     (setq _tilt (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get pt_msg::PanTiltAngles :md5sum-) "da61f3d6b381bd4af7a066f22fdfa441")
(setf (get pt_msg::PanTiltAngles :datatype-) "pt_msg/PanTiltAngles")
(setf (get pt_msg::PanTiltAngles :definition-)
      "float64 pan
float64 tilt

")



(provide :pt_msg/PanTiltAngles "da61f3d6b381bd4af7a066f22fdfa441")


