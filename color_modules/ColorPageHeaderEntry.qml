import QtQuick

Rectangle {
    id: root
    border.width: 2; border.color: "black"
    color: "#ffffff"
    height: 24; width: 96

    property var idx: -1
    property var label: "placeholder"
    property var label_color: "black"

    Text {
        anchors.centerIn: parent
        color: label_color
        font.family: "Geist Mono"; font.pointSize: 12
        text: label
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {

            if(parent.label == "Color Maps") {
                color_map_header.border.color = "black"
                color_map_header.label_color = "black"
                window_header.border.color = "white"
                window_header.label_color = "gray"
                color_map_page.visible = true
                window_page.visible = false
            }
            else {
                color_map_header.border.color = "white"
                color_map_header.label_color = "gray"
                window_header.border.color = "black"
                window_header.label_color = "black"
                color_map_page.visible = false
                window_page.visible = true
            }
        }
    }
}
