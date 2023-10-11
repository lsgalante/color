import QtQuick
import QtQuick.Window

Rectangle {
	id: root
	height: 31; width: 35
	color: "black"
	anchors.bottom: tray.top
	anchors.right: tray.right

	property var mode: "hsl"

	Column {
		id: entries_column
		anchors.fill: parent
		spacing: 1

		Rectangle {
			id: hsl_entry
			y: 0
			height: 15; width: 35
			color: "lightgray"

			Text {
				text: "hsl"
				x: 5

				MouseArea {
					anchors.fill: parent

					onClicked: {
						mode = "hsl"
					}
				}

				Connections {
					target: root

					function onModeChanged() {
						if(mode == "hsl") {
							hsl_entry.color = "lightgray";
						}

						else {
							hsl_entry.color = "gray"
						}
					}
				}
			}
		}

		Rectangle {
			id: rgb_entry
			y: 15
			height: 15; width: 35
			color: "gray"

			Text {
				text: "rgb"
				x: 5

				MouseArea {
					anchors.fill: parent

					onClicked: {
						mode = "rgb"
					}
				}

				Connections {
					target: root

					function onModeChanged() {
						if(mode == "rgb") {
							rgb_entry.color = "lightgray";
						}

						else {
							rgb_entry.color = "gray"
						}
					}
				}
			}
		}
	}
}