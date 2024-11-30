// ColorFormatContainer.qml
import QtQuick

Rectangle {
    id: root
    anchors.fill: parent
    color: "black"

    Column {
        anchors.top: parent.top
        ColorFormat {
            format: "rgb"
            label: "rgb"
        
        }
        ColorFormat {
            format: "hsv"
            label: "hsv"
        }
        ColorFormat {
            format: "hex"
            label: "hex"
        }
    }

    Rectangle {
        id: info
        anchors.bottom: parent.bottom
        height: 100; width: 200
        color: "black"
        border.color: "white"; border.width: 1
    }
}
