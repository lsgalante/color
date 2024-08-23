import QtQuick
import QtQuick.Window
import QtQml

Window {
	id: root
	visible: true
	height: 200; width: 200
	// color: {
 //        var state = bridge.get_state()
	// 	var val_arr = state["val_arr"]
	// 	if(state["encoding"] == "rgb") {
	// 		return Qt.rgba(val_arr[0], val_arr[1], val_arr[2], 1)
	// 	}
	// 	if(state["encoding"] == "hsl") {
	// 		return Qt.hsla(val_arr[0], val_arr[1], val_arr[2], 1)
	// 	}
	// }
	MouseArea {
		anchors.fill: parent
	}
}
