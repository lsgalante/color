// ColorSettings.qml
import QtQuick
import QtQuick.Controls

Column {
    id: root
    spacing: 0
    anchors.fill: parent

    ColorRect {
        id: tabbar
        height: 20; width: parent.width
        Row {
            anchors.fill: parent

            ColorRect {
                id: tab_format
                height: parent.height; width: parent.width / 2
                ColorText {
                    anchors.centerIn: parent
                    text: {
                        if (settings_tab == "format") {return "[ format ]";}
                        else {return "format";}
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: settings_tab = "format"
                }
            }

            ColorRect {
                id: tab_window
                height: parent.height; width: parent.width / 2
                ColorText {
                    anchors.centerIn: parent
                    text: {
                        if (settings_tab == "window") {return "[ window ]";}
                        else {return "window";}
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: settings_tab = "window"
                }
            }
        }
    }

    Rectangle {
        id: divider
        color: "blue"
        height: 2; width: parent.width
    }
    
    ColorRect {
        id: pages
        height: parent.height - tabbar.height - divider.height; width: parent.width

        ColorFormatContainer {
            id: page_color_format
            visible: settings_tab == "format"
        }

        Column {
            id: option_col
            visible: settings_tab == "window"
            height: parent.height; width: parent.width

            Row {
                height: 20; width: parent.width
                spacing: 1
                ColorRect {
                    height: parent.height; width: 100
                    ColorText {
                        text: " display shape: "
                    }
                }
                ColorRect {
                    height: parent.height; width: 50
                    ColorText {
                        text: {
                            if (display_shape == "square") return "[square]"
                            else return "square"
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: display_shape = "square"
                    }
                }
                ColorRect {
                    height: parent.height; width: 45
                    ColorText {
                        text: {
                            if (display_shape == "circle") return "[circle]"
                            else return "circle"
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: display_shape = "circle"
                    }
                }
            }
        }
    }
}
