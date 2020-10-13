<!doctype html>
<html lang="ja">
  <head>
    <title>Gamepad DEmo</title>
    <meta charset="UTF-8">
  </head>
    <body>
      <div id="disp">test</div>
      <script>

//Create AnimationFrame
var rAF = window.mozRequestAnimationFrame ||
    window.webkitRequestAnimationFrame ||
    window.requestAnimationFrame; 

//Update
function update() {
  var pads = navigator.getGamepads ? navigator.getGamepads() :
    (navigator.webkitGetGamepads ? navigator.webkitGetGamepads : []);

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
        console.log(axes);
        document.getElementById("disp").innerHTML = txt;
    }
}

//Start
setInterval("update()",100);

    </script>
  </body>
</html>
