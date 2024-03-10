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

	property var readouts       : []
	property var encoding_main  : ''
	property var colorSpace_main: ''
	property var chVals_main    : [0, 0, 0]
	property var sledPstns_main : [0, 0, 0]
	
	Component.onCompleted: {

		bridge.setReadoutsMain()
		readouts = bridge.readReadoutsMain()
		encoding_main = bridge.readEncodingMain()
		colorSpace_main = bridge.readColorSpaceMain()

		sledPstns_main = bridge.chValsToSledPstns(chVals_main, 350)
	}

	onClosing: {

		bridge.writeState();
		print('Goodbye');
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
