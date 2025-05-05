import QtQuick

ClrRect {
    id: root
    height: 20; width: parent.width

    property var format: "none"
    property var idx: 0
    property var listElement
    property var val: "0"

    Row {
        anchors.fill: parent
        height: parent.height; width: parent.width
        spacing: 1

        ClrText {
            id: label
            height: 20; width: 50
            main: root.main

            text: {
                if(root.idx == root.listElement.idx)
                    return "-" + root.format + "-"
                else
                    return root.format
            }
        }
        ClrTextInput {
            fg: root.main.color_fg
            height: 20; width: parent.width - label.width
            main: root.main
            text: root.val
        }
    }

    MouseArea {
        hoverEnabled: false
        anchors.fill: parent
        onClicked: {
            root.listElement.idx = root.idx;
        }
    }
}
