import QtQuick
import QtQuick.Window
import "modules"

import io.qt.textproperties 1.0

Window
{
	id: main_window

	// property var master_vals: bridge.readMasterVals()
	property var master_vals: [0, 0, 0]
	property var master_alpha: 1

	property var master_sled_pos: bridge.valToSledPos(master_vals, 350)

	property var master_min_vals: [0.00, 0.00, 0.00]
	property var master_max_vals: [1.00, 1.00, 1.00]
	property var master_readout: bridge.concat(master_vals)
	property var master_decimal_places: [2, 2, 2]

	property var master_encoding: "rgb"
	property var master_token: "rgb_lo"

	property var dropdown_state: 1

	visible: true
	color: "black"
	height: 200; width: 200
	x: Screen.width - width - 30; y: 50

	Bridge { id: bridge }

	Preview { id: preview }

	// Tray { id: tray }

	Dropdown { id: dropown }

	Controls { id: controls }
}
