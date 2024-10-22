// ColorEntryContainer.qml

import QtQuick

Rectangle {
  id: root
//  anchors.fill: parent
//  function populate_list() {
// var ct = 0;
// for(var map in maps) {
// 	var encoding = maps[map]["encoding"];
// 	var ch_val_arr = maps[map]["val_arr"];
// 	var component = Qt.createComponent("ColorListEntry.qml");
// 	var entry = component.createObject(map_col, {encoding: encoding, idx: ct});
// 	ct += 1
// 
// }
  Column {
  id: map_col
  spacing: 2

  Component.onCompleted: {
    for(var map in maps) {
      var l = maps[map]["encoding"]
      var component = Qt.createComponent("MapEntry.qml");
      var entry = component.createObject(map_col, {label: l});
    }
  }
  }
}
