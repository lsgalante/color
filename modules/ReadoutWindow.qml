import QtQuick
import QtQuick.Window

Window {
	id:      root
	visible: true
	color:   "black"
	height:  200
	width:   200
	x: sled_window.x - width - 10
	y: sled_window.y

	function populate_encoding_arr() {
		var readout_arr = bridge.get_main_readout_arr();
		var ct = 0;

		for(var readout in readout_arr) {
			var encoding =   readout_arr[ct]["encoding"];
			var ch_val_arr = readout_arr[ct]["ch_val_arr"];
			var component =  Qt.createComponent("Readout.qml");
			var meter =      component.createObject(readout_column, {encoding: encoding, idx: ct});
			ct += 1
		}
	}

	Column {
		id:                    readout_column
		spacing:               2
		Component.onCompleted: populate_encoding_arr()
	}
}
