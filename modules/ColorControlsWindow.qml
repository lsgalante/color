// ColorControlsWindow.qml

import QtQuick
import QtQuick.Window

Window {
  id: root
  visible: true
  flags: Qt.FramelessWindowHint
  color: Qt.hsla(0.1, 0.1, 0.1, 0.5)
  height: 350; width: 80
  // x: Screen.width - 100; y: Screen.height/5
  x: 400
  y: 400
  ColorControls {}
}
