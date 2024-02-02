import QtQuick
import QtQuick.Window

Window
{
	id: root

	visible: true
	color: Qt.hsla(0.1, 0.1, 0.1, 0.5)
	height: 350; width: 80
	x: Screen.width - width * 1.1; y: Screen.height / 2 + height / 5

	Row
	{
		spacing: 1
		anchors.centerIn: parent

		Sled
		{
			id: sled_a

			idx: 0
		}

		Sled
		{
			id: sled_b

			idx: 1
		}

		Sled
		{
			id: sled_c
			
			idx: 2
		}

		// Sled
		// {
		// 	id: alpha
		// }
	}
}