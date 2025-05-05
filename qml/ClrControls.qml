import QtQuick

Rectangle {
    id: root
    color: "transparent"

    property var main
    
    Row {
        id: ch_row
        anchors.fill: parent
        spacing: 0

        ClrSlider {
            id: ch_0
            idx: 0
            main: root.main
            width: parent.width / 4 - parent.spacing
        }

        ClrDivider {
            main: root.main
        }

        ClrSlider {
            id: ch_1
            idx: 1
            main: root.main
            width: parent.width / 4 - parent.spacing
        }

        ClrDivider {
            main: root.main
        }

        ClrSlider {
            id: ch_2
            idx: 2
            main: root.main
            width: parent.width / 4 - parent.spacing
        }

        ClrDivider {
            main: root.main
        }

        ClrSlider {
            id: alpha
            idx: 3
            main: root.main
            width: parent.width / 4 - parent.spacing
        }
    }
}
