import QtQuick

Rectangle
{
	id: handle
	height: parent.height; width: parent.width
	x: 0; y: 0
	color: bg_1

	DragHandler
	{ 
		target:	null

		onActiveChanged: if (active)
		{
			window_main.startSystemMove()
		}
	}
}