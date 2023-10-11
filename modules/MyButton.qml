import QtQuick

Rectangle {
	id: root
	width: 50
	height: 22
	color: bg_2

	property alias label: label.text
	// property alias click: mouse_area.onclick

	Text {
		id: label
		color: fg_1
		anchors {
			horizontalCenter: parent.horizontalCenter
			verticalCenter: parent.verticalCenter
		}
	}
	MouseArea {
		id: mouse_area
		hoverEnabled: true
		anchors { fill: parent }
		onEntered:
		{ parent.color = Qt.lighter(parent.color, 1.5) }
		onExited:
		{ parent.color = Qt.hsla(0.5, 0.1, 0.25, 0.7) }
	}
}