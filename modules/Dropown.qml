import QtQuick
import QtQuick.Window

Window
{
	height: 80; width: 200
	x: main_window.x
	y: main_window.y + main_window.height + 20
	visible: false
	color: "black"

	Column
	{
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenter: parent.verticalCenter

		Rectangle
		{
			id: rgb_vals
			height: 20; width: 150
			anchors.horizontalCenter: parent.horizontalCenter
			color: Qt.hsla(0, 0, 0.5, 1)
			
			Text
			{
				anchors.verticalCenter: parent.verticalCenter
				x: 3
				font.family: "monospace"
				text: "rgb"
				color: "white"
			}
			
			LiveValues
			{
				anchors.right: parent.right
				value_mode: "rgb"
			}
		}

		Rectangle
		{
			id: rgb_hi_vals
			height:20; width: 150
			anchors.horizontalCenter: parent.horizontalCenter
			color: Qt.hsla(0, 0, 0.5, 1)
			
			Text
			{
				anchors.verticalCenter: parent.verticalCenter
				x: 3
				font.family: "monospace"
				text: "rgb-hi"
				color: "white"
			}
			
			LiveValues
			{
				anchors.right: parent.right
				value_mode: "rgb_hi"
			}
		}

		Rectangle
		{
			id: hsl_vals
			height: 20; width: 150
			anchors.horizontalCenter: parent.horizontalCenter
			color: Qt.hsla(0, 0, 0.5, 1)
			
			Text
			{
				anchors.verticalCenter: parent.verticalCenter
				x: 3
				font.family: "monospace"
				text: "hsl"
				color: "white"
			}
			
			LiveValues
			{
				anchors.right: parent.right
				value_mode: "hsl"
			}
		}

		Rectangle
		{
			id: hsl_hi_vals
			height: 20; width: 150
			anchors.horizontalCenter: parent.horizontalCenter
			color: Qt.hsla(0, 0, 0.5, 1)

			Text
			{
				anchors.verticalCenter: parent.verticalCenter
				x: 3
				font.family: "monospace"
				text: "hsl-hi"
				color: "white"
			}

			LiveValues
			{
				anchors.right: parent.right
				value_mode: "hsl"
			}
		}
	}
}