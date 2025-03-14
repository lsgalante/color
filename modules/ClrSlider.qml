import QtQuick
import QtQuick.Shapes

ClrRect {
    id: root
    color: "black"
    height: parent.height; width: parent.width

    // Rectangle {
    //     height: parent.height; width: parent.width
    //     gradient: Gradient {
    //         GradientStop { position: 0.0; color: "transparent" }
    //         GradientStop { position: 1.0; color: "red" }
    //     }
    // }

    property var idx: -1
    property var len: height - sled_size
    property var sled_size: 2
    property var val: 0.0

    Component.onCompleted: {
        val = 0.5;
        sled.y = val * len;
    }

    onValChanged: {
        if (val < 0) val = 0;
        else if (val > 1) val = 1;

        sled.y = len - (val * len);

        if (idx == 0) root.main.ch0 = val;
        else if (idx == 1) root.main.ch1 = val;
        else if (idx == 2) root.main.ch2 = val;
        else if (idx == 3) root.main.ch3 = val;
    }

    ClrRect {
        id: sled
        anchors.left: parent.left
        color: main.color_fg
  	    height: 6; width: parent.width
  	    main: root.main
        y: 0
    }

    ClrRect {
        id: label
        anchors.bottom: parent.bottom; anchors.horizontalCenter: parent.horizontalCenter
        color: "transparent"
        height: 40; width: 60
        main: root.main
        rotation: 90
        ClrText {
	        anchors.centerIn: parent
            color: "transparent"
            main: root.main
            text: root.val.toFixed(2)
	    }
    }

    MouseArea {
        anchors.fill: parent
        drag {
            target: sled
	        axis: Drag.YAxis
	        maximumY: root.len; minimumY: 0
	    }
	    onPositionChanged: {
	        root.val = 1 - (sled.y / root.len);
	    }
    }

    WheelHandler {
        orientation: Qt.Vertical
        rotationScale: 15
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        onWheel: (event)=> {
            let delta = event.angleDelta.y;
            root.val += delta / 2000;
        }
    }
}
