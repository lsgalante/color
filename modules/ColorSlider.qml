// ColorSlider.qml
import QtQuick

Rectangle {
    id: root
    color: "black"
    height: parent.height; width: parent.width
    property var idx: -1
    property var pos: 0.5

    Rectangle {
        id: sled
  	    height: 6; width: parent.width
        y: pos * parent.height
	    anchors.left: parent.left
    }
    Rectangle {
        id: label_container
        color: "transparent"
        height: 20; width: 50
        rotation: 90
        anchors.centerIn: parent
        Text {
            color: Qt.hsla(0.00, 0.00, 0.35, 1.00)
            text: sled.y.toFixed(2)
	        anchors.centerIn: parent
	    }
    }

    Component.onCompleted: {
        pos = sled.y / (parent.height - 6);
        if(idx == 0) ch0 = pos;
        else if(idx == 1) ch1 = pos;
        else if(idx == 2) ch2 = pos;
        else if(idx == 3) ch3 = pos;
    }

    MouseArea {
        anchors.fill: parent
        drag {
            target: sled
	        axis:Drag.YAxis
	        maximumY: parent.height - sled.height; minimumY: 0
	    }
	    onPositionChanged: {
	        pos = sled.y / (parent.height - 6);
	        if(idx == 0) ch0 = pos;
	        else if(idx == 1) ch1 = pos;
	        else if(idx == 2) ch2 = pos;
	        else if(idx == 3) ch3 = pos;
	    }
    }

    WheelHandler {
        orientation: Qt.Vertical
        rotationScale: 15
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        onWheel: (event)=> {
            let delta = event.angleDelta.y;
            sled.y -= delta / 50;
            if(sled.y < 0) sled.y = 0;
            else if(sled.y > 196) sled.y = 196;
            pos = sled.y / (parent.height - 6);
            if(idx == 0) ch0 = pos;
            else if(idx == 1) ch1 = pos;
            else if(idx == 2) ch2 = pos;
            else if(idx == 3) ch3 = pos;
        }
    }
}
