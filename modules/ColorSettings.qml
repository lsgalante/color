// ColorSettings.qml
import QtQuick
import QtQuick.Controls

Column {
    id: root
    spacing: 0
    anchors.fill: parent

    Rectangle {
        id: tabbar
        height: 20; width: parent.width
        Row {
            anchors.fill: parent

            Rectangle {
                id: tab_format
                height: parent.height; width: parent.width / 2
                color: "black";
                Text {
                    anchors.centerIn: parent
                    color: "white"
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

            Rectangle {
                id: tab_window
                height: parent.height; width: parent.width / 2
                color: "black"
                Text {
                    anchors.centerIn: parent
                    color: "white"
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
    
    Rectangle {
        height: parent.height - tabbar.height; width: parent.width    

        ColorFormatContainer {
          id: page_color_format
          visible: settings_tab == "format"
        }

        Rectangle {
            id: page_window
            visible: settings_tab == "window"
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
