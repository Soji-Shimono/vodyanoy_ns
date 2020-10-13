var ros = new ROSLIB.Ros({url : 'ws://' + location.hostname + ':9090'});

ros.on('connection',function() {console.log('websocket: connected'); });
ros.on('error', function() {console.log('websocket error: ', error); });
ros.on('close', function() {console.log('websocket: closed');});

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
    document.getElementById("joy_ch0").innerHTML = message["axes"][0];
    document.getElementById("joy_ch1").innerHTML = message["axes"][1];
    document.getElementById("joy_ch2").innerHTML = message["axes"][2];
    document.getElementById("joy_ch3").innerHTML = message["axes"][3];
});