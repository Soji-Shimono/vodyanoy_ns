var ros = new ROSLIB.Ros({url : 'ws://' + location.hostname + ':9090'});

ros.on('connection',function() {console.log('websocket: connected'); });
ros.on('error', function() {console.log('websocket error: ', error); });
ros.on('close', function() {console.log('websocket: closed');});

var vel = new ROSLIB.Topic({
    ros : ros,
    //name : '/cmd_vel',
    //messageType : 'geometry_msgs/Twist'
    name : '/joy',
    messageType : 'sensor_msgs/Joy'
});

function pubmessage(){
    var pads = navigator.getGamepads ? navigator.getGamepads() :
    (navigator.webkitGetGamepads ? navigator.webkitGetGamepads : []);
    pads = pads[0];
    document.getElementById("padname").innerHTML = "Connecting";
    if(pads) {
        document.getElementById("padname").innerHTML = "Connecting1";
        var but = [];
        var axes = [];
        console.log(pads.id);
        switch (pads.id) {
            case "Xbox 360 Controller (XInput STANDARD GAMEPAD)":
                document.getElementById("padname").innerHTML = "xbox";
                console.log("xbox connected")
                //get button state
                for(var i = 0 ; i < 17; i++) {
                    var val = pads.buttons[i];
                    var pressed = val == 1.0;
                    if (typeof(val) == "object") {
                        pressed = val.pressed;
                        val     = val.value;
                    }
                    if(pressed){
                        but[i] = 1.0;
                    }else{
                        but[i] = 0;
                    }            
                }
                //get axes state
                for (var i = 0; i < 4; i++) {
                    axes[i] = pads.axes[i]
                }                
                break;
            case "Speedy Gaming Controller Extended Gamepad":
                document.getElementById("padname").innerHTML = "pxn";
                for(var i = 0 ; i < 17; i++) {
                    if(i < 8){
                        var val = pads.buttons[i];
                        var pressed = val == 1.0;
                        if (typeof(val) == "object") {
                            pressed = val.pressed;
                            val     = val.value;
                        }
                        if(pressed){
                            but[i] = 1;
                        }else{
                            but[i] = 0;
                        }
                    }else{
                        but[i] = 0;
                    }
                }
                if(pads.axes[4] > 0.5){
                    but[14] = 1;
                }else if(pads.axes[4] < -0.5){
                    but[15] = 1;
                }
                if(pads.axes[5] > 0.5){
                    but[12] = 1;
                }else if(pads.axes[5] < -0.5){
                    but[13] = 1;
                }

                //get axes state
                for (var i = 0; i < 4; i++) {
                    axes[i] = pads.axes[i];
                }
                break;
            case "GV150 Extended Gamepad":
                console.log("GV150 connected");
                document.getElementById("padname").innerHTML = "GV150";
                for(var i = 0 ; i < 17; i++) {
                    if(i < 8){
                        var val = pads.buttons[i];
                        var pressed = val == 1.0;
                        if (typeof(val) == "object") {
                            pressed = val.pressed;
                            val     = val.value;
                        }
                        if(pressed){
                            but[i] = 1;
                        }else{
                            but[i] = 0;
                        }
                    }else{
                        but[i] = 0;
                    }
                }
                if(pads.axes[4] > 0.5){
                    but[14] = 1;
                }else if(pads.axes[4] < -0.5){
                    but[15] = 1;
                }
                if(pads.axes[5] > 0.5){
                    but[12] = 1;
                }else if(pads.axes[5] < -0.5){
                    but[13] = 1;
                }

                //get axes state
                for (var i = 0; i < 4; i++) {
                    axes[i] = pads.axes[i];
                }
                break;
            default:
                console.log("unknown joy");
                break;
        }        
        
        v = new ROSLIB.Message({header:{frame_id:pads.id},
            axes:axes,
            buttons:but
        });
        vel.publish(v);
    }else{
        document.getElementById("padname").innerHTML = pads;
    }
}
//setInterval(pubmessage,100);
setInterval("pubmessage()",100);

function quaternion2eular(q0,q1,q2,q3){
    var roll;
    var pitch;
    var yaw;
    roll = Math.atan(2 * (q0 * q1 + q2 * q3 ) / (Math.pow(q0,2) - Math.pow(q1,2) - Math.pow(q2,2) + Math.pow(q3,2)));
    pitch = Math.asin( 2 * (q0 * q2 - q1 * q3));
    yaw = Math.atan(2 * (q0 * q3 + q1 * q2 ) / (Math.pow(q0,2) + Math.pow(q1,2) - Math.pow(q2,2) - Math.pow(q3,2)));
    return Array(roll,pitch,yaw);
}

var ls = new ROSLIB.Topic({
    ros:ros,
    name :'/joy',
    messageType : 'sensor_msgs/Joy'

});
ls.subscribe(function(message){
    document.getElementById("Surge").value = message["axes"][3] * 100;
    document.getElementById("Sway").value = message["axes"][0] * 100;
    document.getElementById("Heave").value = message["axes"][1] * -100;
    document.getElementById("Pitch").value = message["axes"][5] * 100;
    document.getElementById("Roll").value = message["axes"][4] * 100;
    document.getElementById("Yaw").value = message["axes"][2] * 100;
});

//Subscribe PanTilt angele
var ls2 = new ROSLIB.Topic({
    ros:ros,
    name : '/PanTiltAngles',
    messageType : 'pt_msg/PanTiltAngles'
});
ls2.subscribe(function(message){
    document.getElementById("angle_pan").innerHTML = message.pan.toFixed(1);
    document.getElementById("angle_tilt").innerHTML = message.tilt.toFixed(1);
});

/*
//Subscribe Imu potic
var ls3 = new ROSLIB.Topic({
    ros:ros,
    name : '/imu',
    messageType : 'sensor_msgs/Imu'
});
ls3.subscribe(function(message){
    //console.log(message);
    
    //document.getElementById("angle_yaw").innerHTML = message["orientation"]["x"];
    //document.getElementById("angle_pitch").innerHTML = message["orientation"]["y"];
    //document.getElementById("angle_roll").innerHTML = message["orientation"]["z"];
    
    var vehicle_orientation = quaternion2eular(
        message["orientation"]["x"], 
        message["orientation"]["y"],
        message["orientation"]["z"],
        message["orientation"]["w"]
    );
    document.getElementById("angle_yaw").innerHTML = (vehicle_orientation[2] * 180 / Math.PI).toFixed(2);
    document.getElementById("angle_pitch").innerHTML = (vehicle_orientation[1] * 180 / Math.PI).toFixed(2);
    document.getElementById("angle_roll").innerHTML = (vehicle_orientation[0] * 180 / Math.PI).toFixed(2);

});
*/
//Subscribe Attitude potic
var ls3 = new ROSLIB.Topic({
    ros:ros,
    name : '/vehicleAttitude',
    messageType : 'geometry_msgs/Vector3'
});
ls3.subscribe(function(message){
    document.getElementById("angle_yaw").innerHTML = (message.z * 180 / Math.PI).toFixed(2);
    document.getElementById("angle_pitch").innerHTML = (message.y * 180 / Math.PI).toFixed(2);
    document.getElementById("angle_roll").innerHTML = (message.x * 180 / Math.PI).toFixed(2);
});


//Subscribe Control mode
var ls4 = new ROSLIB.Topic({
    ros:ros,
    name : '/mode',
    messageType : 'std_msgs/String'
});
ls4.subscribe(function(message){
    document.getElementById("mode").innerHTML = message.data;
});

//Subscribe BatteryState
var ls5 = new ROSLIB.Topic({
    ros:ros,
    name : '/BatteryState',
    messageType : 'sensor_msgs/BatteryState'
});
ls5.subscribe(function(message){
    document.getElementById("battVoltage").value = message.voltage.toFixed(2);
    document.getElementById("battCurrent").value = message.current.toFixed(2);
    document.getElementById("battVoltage_Value").innerHTML = message.voltage.toFixed(2);
    document.getElementById("battCurrent_Value").innerHTML = message.current.toFixed(2);
    
});

//Subscribe Temp
var ls6 = new ROSLIB.Topic({
    ros:ros,
    name : '/Temp',
    messageType : 'sensor_msgs/Temperature'
});
ls6.subscribe(function(message){
    document.getElementById("watertemp").innerHTML = message.temperature.toFixed(2);
    //document.getElementById("depth").innerHTML = 90;
});

//Subscribe Depth
var ls7 = new ROSLIB.Topic({
    ros:ros,
    name : '/Depth',
    messageType : 'geometry_msgs/Point'
});
ls7.subscribe(function(message){
    document.getElementById("depth").innerHTML = message.z.toFixed(2);
});

//Subscribe targetPos
var ls8 = new ROSLIB.Topic({
    ros:ros,
    name : '/targetPos',
    messageType : 'geometry_msgs/Vector3'
});
ls8.subscribe(function(message){
    document.getElementById("depthTarget").innerHTML = message.z.toFixed(1);
});

//Subscribe targetPos
var ls9 = new ROSLIB.Topic({
    ros:ros,
    name : '/targetAngle',
    messageType : 'geometry_msgs/Vector3'
});
ls9.subscribe(function(message){
    document.getElementById("rollTarget").innerHTML = (message.x * 180 / Math.PI).toFixed(1);
    document.getElementById("pitchTarget").innerHTML = (message.y * 180 / Math.PI).toFixed(1);
    document.getElementById("yawTarget").innerHTML = (message.z * 180 / Math.PI).toFixed(1);
});

//Subscribe targetPos
var ls10 = new ROSLIB.Topic({
    ros:ros,
    name : '/vehicleAngularVelosity',
    messageType : 'geometry_msgs/Vector3'
});
ls10.subscribe(function(message){
    document.getElementById("rollSpeed").innerHTML = (message.x).toFixed(2);
    document.getElementById("pitchSpeed").innerHTML = (message.y).toFixed(2);
    document.getElementById("yawSpeed").innerHTML = (message.z).toFixed(2);
});

//Subscribe targetPos
var ls11 = new ROSLIB.Topic({
    ros:ros,
    name : '/vehicleSpd',
    messageType : 'geometry_msgs/Vector3'
});
ls11.subscribe(function(message){
    document.getElementById("depthSpeed").innerHTML = (message.z).toFixed(2);
});

//Subscribe targetPos
var ls12 = new ROSLIB.Topic({
    ros:ros,
    name : '/twistSpd',
    messageType : 'geometry_msgs/Twist'
});
ls12.subscribe(function(message){
    document.getElementById("spd_linear_x").innerHTML = (message.linear.x).toFixed(2);
    document.getElementById("spd_linear_y").innerHTML = (message.linear.y).toFixed(2);
    document.getElementById("spd_linear_z").innerHTML = (message.linear.z).toFixed(2);
    document.getElementById("spd_angular_x").innerHTML = (message.angular.x).toFixed(2);
    document.getElementById("spd_angular_y").innerHTML = (message.angular.y).toFixed(2);
    document.getElementById("spd_angular_z").innerHTML = (message.angular.z).toFixed(2);
});

//document.getElementById('camstream').data='http://192.168.2.111:8080/?action=stream';
document.getElementById('camstream').data='http://192.168.128.103:8080/?action=stream';
