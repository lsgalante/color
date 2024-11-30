// ColorSlider.qml
import QtQuick

Rectangle {
    id: root
    color: "black"
    height: parent.height; width: parent.width
    property var idx: -1
    property var val: 0.0
    property var len: height - 6

    Component.onCompleted: {
        val = 0.5;
        sled.y = val * len;
    }

    onValChanged: {
        if(val < 0)
            val = 0;
        else if(val > 1)
            val = 1;
        sled.y = len - (val * len);
        if (idx == 0) ch0 = val;
        else if (idx == 1) ch1 = val;
        else if (idx == 2) ch2 = val;
        else if (idx == 3) ch3 = val;
    }

    Rectangle {
        id: sled
  	    height: 6; width: parent.width
        y: 0
        anchors.left: parent.left
    }

    Rectangle {
        id: label
        color: "transparent"
        height: 20; width: 50
        anchors.centerIn: parent
        rotation: 90
        Text {
            color: Qt.hsla(0.00, 0.00, 0.35, 1.00)
            text: val.toFixed(2)
	        anchors.centerIn: parent
	    }
    }

    MouseArea {
        anchors.fill: parent
        drag {
            target: sled
	        axis: Drag.YAxis
	        maximumY: len; minimumY: 0
	    }
	    onPositionChanged: {
	        val = 1 - (sled.y / len);
	    //     if(idx == 0) ch0 = pos;
	    //     else if(idx == 1) ch1 = pos;
	    //     else if(idx == 2) ch2 = pos;
	    //     else if(idx == 3) ch3 = pos;
	    }
    }

    WheelHandler {
        orientation: Qt.Vertical
        rotationScale: 15
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        onWheel: (event)=> {
            let delta = event.angleDelta.y;
            val += delta / 2000;
            // if(sled.y < 0)
            //     sled.y = 0;
            // else if(sled.y > 196)
            //     sled.y = 196;
            // pos = sled.y / (parent.height - 6);
            // if(idx == 0) ch0 = pos;
            // else if(idx == 1) ch1 = pos;
            // else if(idx == 2) ch2 = pos;
            // else if(idx == 3) ch3 = pos;
        }
    }
}
