
(cl:in-package :asdf)

(defsystem "pt_msg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PanTiltAngles" :depends-on ("_package_PanTiltAngles"))
    (:file "_package_PanTiltAngles" :depends-on ("_package"))
  ))