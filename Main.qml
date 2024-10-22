// Main.qml

import QtQuick
import QtQuick.Window
import QtQml
import io.qt.textproperties 1.0
import "./modules"

Window {
  id: root
  flags: Qt.FramelessWindowHint
  visible: true
  height: 200
  width: 200
  x: Screen.width - 400 - 10
  y: Screen.height - 200 - 25
  color: "blue"

  property string tab_active: "tab_preview"
  property string settings_tab_active: "tab_color_maps"

  Column {
    anchors.fill: parent
    spacing: 0
    ColorTabBar {
      id: color_tab_bar
    }
    Rectangle {
      height: parent.height - color_tab_bar.height
      width: parent.width
      ColorPreview {
        id: color_preview
        visible: tab_active == "tab_preview"
      }
      ColorSettings {
        id: color_settings
        visible: tab_active == "tab_settings"
      }
      ColorControls {
        id: color_controls
        visible: tab_active == "tab_controls";
      }
    }
  }

  Bridge {
    id: bridge
  }

  onClosing: print("Exiting");

  property var rgb_val_arr: [0, 0, 0]
  property var ch_val_arr: [0.5, 0.5, 0.5, 0.5]
  property var encoding: "rgb"

  property var state: {
    "map": "rgb_lo",
    "val_arr": [0, 0, 0],
    "p_arr": [0, 0, 0],
    "label": "label"
  }

  property var maps: {
    "rgb_lo": {
      "encoding": "rgb",
      "min": [0.00, 0.00, 0.00],
      "max": [1.00, 1.00, 1.00]
    },
    "rgb_hi": {
      "encoding": "rgb",
      "min": [0, 0, 0],
      "max": [255, 255, 255]
    },
    "hsl_lo": {
      "encoding": "hsl",
      "min": [0.00, 0.00, 0.00],
      "max": [1.00, 1.00, 1.00]
    },
    "hsl_hi": {
      "encoding": "hsl",
      "min": [0, 0, 0],
      "max": [360, 100, 100]
    },
    "hex": {
      "encoding": "hex",
      "min": [0, 0, 0],
      "max": [255, 255, 255]
    }
  }
}
