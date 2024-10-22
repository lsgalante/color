// ColorPreview.qml

import QtQuick

Rectangle {
  id : root
  height: parent.height
  width: parent.width

  color: {
    if (encoding == "rgb") 
      return Qt.rgba(ch_val_arr[0], ch_val_arr[1], ch_val_arr[2], ch_val_arr[3]);
    else if (encoding == "hsl")
      return Qt.hsla(ch_val_arr[0], ch_val_arr[1], ch_val_arr[2], ch_val_arr[3]);
  }
    
  MouseArea {
    anchors.fill: parent
  }
}
