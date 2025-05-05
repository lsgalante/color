import QtQuick 

ClrRect {
    id: root
    property var idx: 0
    property var selected: {tabBarElement.idx == idx}
    property var tabBarElement
    property var label: "ClrTab"

    height: parent.height

    ClrText {
        anchors.centerIn: parent
        main: root.main
        text: {
            if(root.selected)
                return "-" + root.label + "-"
            else
                return root.label
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.tabBarElement.idx = root.idx
    }
}
