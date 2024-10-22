// ColorSettingsWindow.qml

import QtQuick
import QtQuick.Controls
import QtQuick.Window

Window {
  color: "black"
  id: root
  flags: Qt.FramelessWindowHint
  height: 200; width: 200
  visible: true
  x: Screen.width - 200 - 20
  y: Screen.height - 200 - 25
  ColorSettings {}
}
