import QtQuick
import QtQuick.Window
import "modules"
import io.qt.textproperties 1.0

Window {

	id          : main_window
	visible     : true
	color       : "black"
	height      : 200
	width       : 200
	x: Screen.width - sled_window.width - width - 35
	y: Screen.height - height * 3.2

	property var readout_arr:     []
	property var main_encoding:   ''
	property var main_colorspace: ''
	property var main_ch_val_arr: [0, 0, 0]
	property var main_sled_p_arr: [0, 0, 0]

	Component.onCompleted: {
		bridge.set_main_readout_arr()
		readout_arr =     bridge.get_main_readout_arr()
		main_encoding =   bridge.get_main_encoding()
		main_colorspace = bridge.get_main_colorspace()
		main_sled_p_arr = bridge.ch_val_arr_to_sled_p_arr(main_ch_val_arr, 350)
	}
	onClosing: {
		bridge.write_state();
		print('Exiting');
	}
	Bridge {
		id: bridge
	}
	Preview {
		id: preview
	}
	ReadoutWindow {
		id: readout_window
	}
	SledWindow {
		id: sled_window
	}
}
