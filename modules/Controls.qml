import QtQuick

Rectangle {
	id: root
	width: 80
	height: 410
	radius: 10
	color: Qt.hsla(0.1, 0.1, 0.1, 0.5)
	visible: false

	Row {
		spacing: 5
		y: 5 
		anchors { horizontalCenter: parent.horizontalCenter }
		Sled { id: sled_a }
		Sled { id: sled_b }
		Sled { id: sled_c }
	}
}