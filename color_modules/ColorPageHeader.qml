import QtQuick

Rectangle {
    id: root
    border.color: "green"; border.width: 4
    color: "red"
    height: 32; width: 200

    property var selected_entry: "ass"

    Row {
        height: parent.height - 8; width: parent.width - 186
        spacing: 0
        x: 4; y: 4
        ColorPageHeaderEntry {
            id: "color_map_header"
            idx: 0
            label: "Color Maps"
        }
        ColorPageHeaderEntry {
            id: "window_header"
            idx: 1
            label: "Window"
            label_color: "gray"
            border.color: "white"
        }
    }
}
