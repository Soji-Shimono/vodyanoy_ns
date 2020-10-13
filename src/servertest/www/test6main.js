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
  //console.log(pads.axes);
  
  //tekitou
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
            but[i] = val;
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
    
        console.log(pads.axes);  
        //console.log();
        v = new ROSLIB.Message({axes:pads.axes
            ,buttons:but
            //,angular:{x:0,y:0,z:0}
        });
        vel.publish(v);
    }
}
setInterval(pubmessage,10);

var ls = new ROSLIB.Topic({
    ros:ros,
    name :'/joy',
    messageType : 'sensor_msgs/Joy'

});
ls.subscribe(function(message){
    //str = JSON.stringify(message);
    //document.getElementById("joy").innerHTML = str;
    //console.log(str);
    //for(e in message){
    //    //document.getElementById(e).innerHTML = message[e];
    //    console.log(e);
    //}
    //console.log(message["axes"][0]);
    document.getElementById("joy_ch0").innerHTML = "100";
    document.getElementById("joy_ch1").innerHTML = message["axes"][1];
    document.getElementById("joy_ch2").innerHTML = message["axes"][2];
    document.getElementById("joy_ch3").innerHTML = message["axes"][3];
});

var ls2 = new ROSLIB.Topic({
    ros:ros,
    name : '/PanTiltAngles',
    messageType : 'pt_msg/PanTiltAngles'
});
ls2.subscribe(function(message){
    document.getElementById("panAngle").innerHTML = message.pan;
    document.getElementById("tiltAngle").innerHTML = message.tilt;
});
document.getElementById('camstream').data='http://192.168.128.100:8080/?action=stream'