import QtQuick

Rectangle {
	id: root
	color: "transparent"
	height: parent.height; width: 100

	Row {
		spacing: 5
		anchors.horizontalCenter: parent.horizontalCenter

		Text {
			text: val_a
			color: "white"
		}
		Text {
			text: val_b
			color: "white"
		}
		Text {
			text: val_c
			color: "white"
		}
	}

	TextEdit {
		id: storage
		visible: false
	}

	MouseArea {
		anchors.fill: parent

		onEntered: {
			root.color = Qt.hsla(0.29, 0.32, 0.22, 1.00)
		}
		onExited: {
			root.color = "transparent"
		}
		onClicked: {
			storage.text = String(val_a) + " " + String(val_b) + " " + String(val_c)
			storage.selectAll()
			storage.copy()
		}
	}
}