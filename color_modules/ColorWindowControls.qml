import QtQuick
import QtQuick.Window

Window {
	id: ctl_win
	visible: control_window_state["visible"]
	flags: Qt.FramelessWindowHint
	color: Qt.hsla(0.1, 0.1, 0.1, 0.5)
	height: 350; width: 80
	x: Screen.width - 100; y: Screen.height/5
	// Row {
		// id: ch_row
		// spacing: 1
		// anchors.centerIn: parent
		// Track {
			// id: ch_0
			// idx: 0
		// }
		// Track {
			// id: ch_1
			// idx: 1
		// }
		// Track {
			// id: ch_2
			// idx: 2
		// }
		// Sled {
		// 	id: alpha
		// }
	// }
}
