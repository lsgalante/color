import QtQuick

Rectangle {
	id:     root
	height: 16
	width:  200
	color:  {
		if(main_encoding == encoding) { return Qt.hsla(0.00, 0.30, 0.40, 1.00) }
		else { return Qt.hsla(0, 0, 0.6, 1) }
	}

	property var idx:              0
	property var readout:          readout_arr[idx]
	property var encoding:         readout["encoding"]
	property var colorspace:       readout["colorspace"]
	property var ch_val_arr:       readout["ch_val_arr"]
	property var encoding_val_arr: readout["encoding_val_arr"]
	property var display_val:      readout["display_val"]

	Row {
		spacing: 10
		x: 13
		Rectangle {
			id:     encoding_label
			color : "transparent"
			height: 16
			width:  50
			Text {
				font.family:      "Geist Mono"
				font.pointSize:   12
				text:             encoding
				anchors.centerIn: parent
			}
		}
		Rectangle {
			id:     vals
			color:  "transparent"
			height: 16
			width:  100
			Text {
				font.family: "Geist Mono"
				text:        display_val
			}
		}
	}
	MouseArea {
		hoverEnabled: true
		anchors.fill: parent
		onClicked: {
			main_encoding =   encoding;
			main_colorspace = colorspace;
			main_ch_val_arr = ch_val_arr;
			main_sled_p_arr = bridge.ch_val_arr_to_sled_p_arr(ch_val_arr, 350)
			bridge.set_main_encoding(encoding);
			bridge.set_main_colorspace(colorspace);
			bridge.set_main_ch_val_arr(ch_val_arr);
		}
	}
}
