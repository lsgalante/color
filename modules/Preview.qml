import QtQuick

Rectangle {
	id:     root
	height: 200
	width:  200
	color:  {
		var main_colorspace = bridge.get_main_colorspace()

		if(main_colorspace == "rgb") {
			return Qt.rgba(main_ch_val_arr[0], main_ch_val_arr[1], main_ch_val_arr[2], 1)
		}
		if(main_colorspace == "hsl") {
			return Qt.hsla(main_ch_val_arr[0], main_ch_val_arr[1], main_ch_val_arr[2], 1)
		}
	}
	MouseArea {
		anchors.fill: parent
	}
}
