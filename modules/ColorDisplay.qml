// ColorDisplay.qml
import QtQuick

Rectangle {
    id : root
    anchors.fill: parent
    color: {
        return Qt.rgba(ch0, ch1, ch2, 1.0);
    }
    
    MouseArea {
        anchors.fill: parent
    }
}
