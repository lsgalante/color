// ColorSettings.qml
import QtQuick
import QtQuick.Controls

Column {
    id: root
    spacing: 0
    anchors.fill: parent

    Rectangle {
        id: settings_tab_bar
        height: 20; width: parent.width
        Row {
            anchors.fill: parent

            Rectangle {
                id: tab_color_format
                height: parent.height; width: parent.width / 2
                color: {
                    if (settings_tab_active == "tab_color_format")
                        return "gray";
                    else
                        return "white";
                }
                Text {
                    anchors.centerIn: parent
                    text: "color_format"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: settings_tab_active = "tab_color_format"
                }
            }

            Rectangle {
                id: tab_window
                height: parent.height; width: parent.width / 2
                color: {
                    if (settings_tab_active == "tab_window")
                        return "gray";
                    else
                        return "white";
                }
                Text {
                    anchors.centerIn: parent
                    text: "window"    
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: settings_tab_active = "tab_window"
                }
            }
        }
    }
    
    Rectangle {
        height: parent.height - settings_tab_bar.height; width: parent.width    

        ColorFormatContainer {
          id: page_color_format
          visible: settings_tab_active == "tab_color_format"
        }

        Rectangle {
            id: page_window
            visible: settings_tab_active == "tab_window"
            color: "green"
            anchors.fill: parent

            CheckBox {
                text: "Controls"
                y: 100
                checked: true
                nextCheckState: function() {
                    if (checkState == Qt.Checked) {
                        ctl_win.visible = false;
                        return Qt.Unchecked;
                    } else {
                        ctl_win.visible = true;
                        return Qt.Checked;
                    }
                }
            }
        }
    }
}
