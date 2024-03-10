import QtQuick
import QtQuick.Window

Window {
	id     : root
	visible: true
	color  : Qt.hsla(0.1, 0.1, 0.1, 0.5)
	height : 350
	width  : 80
	x: Screen.width - width - 25
	y: Screen.height - height - 60


	Row {
		id              : channel_row
		spacing         : 1
		anchors.centerIn: parent

		Sled {
			id : channel_a
			idx: 0
		}
		Sled {
			id : channel_b
			idx: 1
		}
		Sled {
			id : channel_c
			idx: 2
		}
		// Channel {
		// 	id: alpha
		// }
	}
}