import QtQuick

Rectangle {
	id: root
	height: 16; width: 200
	color: "#a0a0a0"
	// color: {
		// if(state["encoding"] == encoding) { return Qt.hsla(0.00, 0.30, 0.40, 1.00) }
		// else { return Qt.hsla(0, 0, 0.6, 1) }
	// }
	property var label: "label"
	property var val: "0, 0, 0"
	Rectangle {
	    id: left_arrow_container
	    color: "black"
		x: 3
		Text {
            font.family: "Geist Mono"
            font.pointSize: 12
            text: ">"
            color: "black"
        }
	}
	Rectangle {
	    id: right_arrow_container
        color: "black"
        x: parent.width - 12
        Text {
            font.family: "Geist Mono"
            font.pointSize: 12
            text: "<"
            color: "black"
        }
	}
	Text {
	    color: "black"
		font.family: "Geist Mono"
		text: label
		x: 18
	}
	TextInput {
	    color: "black"
        font.family: "Geist Mono"
        text: val
        x: 50
	}
	// MouseArea {
	// 	hoverEnabled: true
	// 	anchors.fill: parent
	// 	onClicked: {
	// 		main_encoding = encoding;
	// 		main_colorspace = colorspace;
	// 		main_ch_val_arr = ch_val_arr;
	// 		main_sled_p_arr = bridge.ch_val_arr_to_sled_p_arr(ch_val_arr, 350)
	// 		bridge.set_main_encoding(encoding);
	// 		bridge.set_main_colorspace(colorspace);
	// 		bridge.set_main_ch_val_arr(ch_val_arr);
	// 	}
	// }
}
