import QtQuick

ClrRect {
    id: root
    color: "transparent"

    property var fg: main.color_fg
    property var left_margin: 0
    property var text: "ClrText"
    property var text_alignment: "center"
    
    Text {
        anchors.verticalCenter: parent.verticalCenter
        color: root.fg
        font.family: "Inconsolata"
        text: parent.text

        anchors.centerIn: {
            if (root.text_alignment == "center") return parent;
            else return undefined;
        }
        anchors.left: {
            if (root.text_alignment == "left") return parent.left;
            else return undefined;
        }
        anchors.leftMargin: root.left_margin
    }
}
