function pubmessage(){
    //var pads = navigator.getGamepads ? navigator.getGamepads() :
    //(navigator.webkitGetGamepads ? navigator.webkitGetGamepads : []);
    var pads = navigator.getGamepads(); 
    pads1 = pads[0];
    document.getElementById("Value1").innerHTML = pads1.id;

    pads2 = pads[1];
    document.getElementById("Value2").innerHTML = pads2.id;

    pads3 = pads[2];
    document.getElementById("Value3").innerHTML = pads3.id;
}
setInterval("pubmessage()",100);
