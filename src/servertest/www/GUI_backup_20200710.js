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
    if(pads) {
        //buttons
        var but = [];
        for(var i = 0 ; i < pads.buttons.length; i++) {
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
        //console.log(but);
        var txt = [];
        txt += pads.id + "<br>";
        for(var i = 0 ; i < but.length; i++) {
            if( but[i] == 1)  txt += '<input type="checkbox" checked="checked">';
            else              txt += '<input type="checkbox" >';
        }
        var axes = pads.axes;
        for(var i = 0 ; i < axes.length; i++) {
            txt += '<br>';
            txt += axes[i] ;
        }
        v = new ROSLIB.Message({header:{frame_id:pads.id},
            axes:pads.axes,
            buttons:but
            //,angular:{x:0,y:0,z:0}
        });
        vel.publish(v);
        console.log(pads.id)
        document.getElementById("mode").innerHTML = pads.id;
    }
}
setInterval(pubmessage,100);

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
    document.getElementById("Surge").value = message["axes"][0] * 100;
    document.getElementById("Sway").value = message["axes"][1] * 100;
    document.getElementById("Heave").value = message["axes"][2] * 100;
    document.getElementById("Pitch").value = message["axes"][3] * 100;
    document.getElementById("Roll").value = message["axes"][4] * 100;
    document.getElementById("Yaw").value = message["axes"][5] * 100;
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

//Subscribe Imu potic
var ls3 = new ROSLIB.Topic({
    ros:ros,
    name : '/imu',
    messageType : 'sensor_msgs/Imu'
});
ls3.subscribe(function(message){
    //console.log(message);
    /*
    document.getElementById("angle_yaw").innerHTML = message["orientation"]["x"];
    document.getElementById("angle_pitch").innerHTML = message["orientation"]["y"];
    document.getElementById("angle_roll").innerHTML = message["orientation"]["z"];
    */
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

//Subscribe Control mode
var ls4 = new ROSLIB.Topic({
    ros:ros,
    name : '/mode',
    messageType : 'std_msgs/String'
});
ls4.subscribe(function(message){
    //document.getElementById("mode").innerHTML = message.data;
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

document.getElementById('camstream').data='http://192.168.128.104:8080/?action=stream';