import QtQuick
import QtQuick.Window

Window
{
	id: root
	height: 350; width: 80
	x: Screen.width - width * 1.1
	y: Screen.height / 2 - height / 2
	color: Qt.hsla(0.1, 0.1, 0.1, 0.5)
	visible: true

	property var pos_a: sled_a.pos
	property var pos_b: sled_b.pos
	property var pos_c: sled_c.pos

	Row
	{
		spacing: 1
		anchors.horizontalCenter: parent.horizontalCenter
		Sled
		{
			id: sled_a
		}
		Sled
		{
			id: sled_b
		}
		Sled
		{
			id: sled_c
		}
		Sled
		{
			id: alpha
		}
	}
}