import QtQuick
import QtQuick.Window

Window {
	id     : root
	visible: true
	color  : "black"
	height : 200
	width  : 200
	x: sled_window.x - width - 10
	y: sled_window.y

	function populateEncodings() {

		var readouts = bridge.readReadoutsMain();
		var ct = 0;

		for(var readout in readouts) {
			var encoding = readouts[ct]['encoding'];
			var chVals = readouts[ct]['chVals'];
			var component = Qt.createComponent("Readout.qml");
			var meter = component.createObject(readout_column, {encoding: encoding, idx: ct});
			ct += 1
		}
	}

	Column {
		id     : readout_column
		spacing: 2

		Component.onCompleted: populateEncodings()
	}
}
