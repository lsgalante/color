import QtQuick

ClrRect {
    id: root
    height: 20; width: parent.width

    property var idx: 0
    default property alias rowChildren: rowLayout.data

    Row {
        id: rowLayout
        anchors.fill: parent
    }
}
