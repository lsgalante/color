import QtQuick
import QtQuick.Window
import "modules"

import io.qt.textproperties 1.0


Window {
	id: w1
	height: 215; width: 200
	visible: true
	color: "black"

	property var val_a: (1.00 - sled_a.pos).toFixed(2)
	property var val_b: (1.00 - sled_b.pos).toFixed(2)
	property var val_c: (1.00 - sled_c.pos).toFixed(2)

	property var vals: [val_a, val_b, val_c]

	property var mode: menu.mode

	property var prev_hsla: Qt.hsla(val_a, val_b, val_c, 1.00)
	property var prev_rgba: Qt.rgba(val_a, val_b, val_c, 1.00)

	Bridge {
		id: bridge
	}

	Rectangle {
		id: preview
		height: 200; width: 200
		color: prev_hsla

		Connections {
			target: w1

			function onModeChanged() {
				update()
			}

			function onValsChanged() {
				update()
			}

			function update() {
				if(mode == "hsl") {
					preview.color = prev_hsla
				}

				else if(mode == "rgb") {
					preview.color = prev_rgba
				}
			}
		}
	}

	Rectangle {
		id: tray
		width: 200; height: 20
		y: 200
		color: Qt.hsla(0.30, 0.30, 0.20, 1.00)

		Values {
			anchors.horizontalCenter: parent.horizontalCenter
		}


		Text {
			id: encoding_label
			anchors.right: parent.right
			anchors.rightMargin: 5
			text: mode
			color: "gray"

			MouseArea {
				anchors.fill: parent

				onClicked: {
					if(menu.visible == false) {
						menu.visible = true
					}

					else {
						menu.visible = false
					}
				}
			}
		}
	}

	EncodingMenu {
		id: menu
		visible: false
	}

	Window {
		id: w2
		height: 350; width: 47
		visible: true
		color: "gray"
		x: Screen.width - width * 1.1
		y: Screen.height / 2 - height / 2

		Row {
			spacing: 1
			Sled {
				id: sled_a
			}
			Sled {
				id: sled_b
			}
			Sled {
				id: sled_c
			}
		}
	}
}