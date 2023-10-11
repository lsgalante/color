import QtQuick

Rectangle {
	id:     handle
	width:  parent.width
	height: parent.height
	x:      0
	y:      0
	color:  bg_1

	DragHandler { 
		target:	null

		onActiveChanged: if (active)
		{ window_main.startSystemMove(); }
	}
}