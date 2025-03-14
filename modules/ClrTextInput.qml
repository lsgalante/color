import QtQuick

ClrRect {
    id: root
    color: "transparent"

    property var fg: main.color_fg
    property var text: "ClrTextInput"

    TextInput {
        anchors.verticalCenter: parent.verticalCenter
        color: parent.fg
        font.family: "Inconsolata"
        height: parent.height; width: 100
        // displayText: parent.text
        x: 5
    }
}
