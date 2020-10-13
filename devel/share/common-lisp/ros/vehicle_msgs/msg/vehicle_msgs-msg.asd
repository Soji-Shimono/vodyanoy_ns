
(cl:in-package :asdf)

(defsystem "vehicle_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ThrustCommand" :depends-on ("_package_ThrustCommand"))
    (:file "_package_ThrustCommand" :depends-on ("_package"))
    (:file "ThrustState" :depends-on ("_package_ThrustState"))
    (:file "_package_ThrustState" :depends-on ("_package"))
    (:file "ThrustersCommand" :depends-on ("_package_ThrustersCommand"))
    (:file "_package_ThrustersCommand" :depends-on ("_package"))
    (:file "ThrustersState" :depends-on ("_package_ThrustersState"))
    (:file "_package_ThrustersState" :depends-on ("_package"))
  ))