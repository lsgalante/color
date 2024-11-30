// ColorControls.qml
import QtQuick

Rectangle {
    id: root
    color: Qt.hsla(0.1, 0.1, 0.1, 1.0)
    
    Row {
        id: ch_row
        anchors.fill: parent
        spacing: 1
        ColorSlider {
            id: ch_0
            idx: 0
            width: parent.width / 4 - 1
        }
        ColorSlider {
            id: ch_1
            idx: 1
            width: parent.width / 4 - 1
        }
        ColorSlider {
            id: ch_2
            idx: 2
            width: parent.width / 4 - 1
        }
        ColorSlider {
            id: alpha
            idx: 3
            width: parent.width / 4 - 1
        }
    }
}
