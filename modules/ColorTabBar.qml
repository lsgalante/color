// ColorTabBar.qml

import QtQuick

Rectangle {
  id: root
  height: 20
  width: parent.width

  Row {
    height: parent.height
    width: parent.width

    Rectangle {
      id: tab_preview
      height: parent.height
      width: parent.width / 3 
      color: {
        if (tab_active == "tab_preview") return "gray";
        else return "white";
      }
      Text {
        anchors.centerIn: parent
        text: "preview"
      }
      MouseArea {
        anchors.fill: parent
        onClicked: tab_active = "tab_preview"
      }
    }

    Rectangle {
      id: tab_settings
      height: parent.height
      width: parent.width / 3
      color: {
        if (tab_active == "tab_settings") return "gray";
        else return "white";
      }
      Text {
        anchors.centerIn: parent
        text: "settings"
      }
      MouseArea {
        anchors.fill: parent
        onClicked: tab_active = "tab_settings"
      }
    }

    Rectangle {
      id: tab_controls
      height: parent.height
      width: parent.width / 3
      color: {
        if (tab_active == "tab_controls") return "gray";
        else return "white";
      }
      Text {
        anchors.centerIn: parent
        text: "controls"
      }
      MouseArea {
        anchors.fill: parent
        onClicked: tab_active = "tab_controls"
      }
    }
  }
}
