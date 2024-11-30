// ColorFormat.qml
import QtQuick

Rectangle {
    id: root
    color: "black"
    height: 18; width: 200
    property var format: "None"
    property var label: "label"
    property var val: {
        let val0 = ch0.toFixed(2).toString();
        let val1 = ch1.toFixed(2).toString();
        let val2 = ch2.toFixed(2).toString();
        let val3 = ch3.toFixed(2).toString();
        val0 + " " + val1 + " " + val2 + " " + val3;
    }
    Text {
        color: {
            if (format_active == format) return "white";
            else return "black";
        }
        text: "["
        x: 5
    }
    Text {
        color: {
            if (format_active == format) return "white";
            else return "black";
        }
        text: "]"
        x: 190
    }
    Text {
        color: "white"
        text: label
        x: 18
    }
    TextInput {
        color: "white"
        text: val
        x: 50
    }
    MouseArea {
        hoverEnabled: false
        anchors.fill: parent
        onClicked: {
            format_active = format;
        }
    }
}
