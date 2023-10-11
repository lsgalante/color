import QtQuick

Rectangle {
	id: track
	width: 15; height: 350
	color: "black"

	property var pos: sled.y / (height - sled.height)

	MouseArea {
		anchors.fill: parent
		drag.target: sled
		drag.axis: Drag.YAxis
		drag.minimumY: 0
		drag.maximumY: parent.height - sled.height
	}

	Rectangle {
		id: sled
		height: 6; width: parent.width
		y: track.height - height
		anchors.left: parent.left
	}
}