import QtQuick

Rectangle
{
	id: root
	color: "transparent"
	height: parent.height; width: 100

	property var value_mode: "rgb"

	Row
	{
		spacing: 5
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenter: parent.verticalCenter

		Text
		{
			id: val_a
			width: 28
			font.family: "monospace"
			color: "white"

			text:
			{
				if (value_mode == "rgb")
					return rgb[0]

				if (value_mode == "hsl")
					return hsl[0]

				if (value_mode == "rgb_hi")
					return (rgb[0] * 255).toFixed(0)
			}
		}
		Text
		{
			id: val_b
			width: 28
			font.family: "monospace"
			color: "white"
			
			text:
			{
				if (value_mode == "rgb")
					return rgb[1]
				
				if (value_mode == "hsl")
					return hsl[1]

				if (value_mode == "rgb_hi")
					return (rgb[1] * 255).toFixed(0)
			}
		}
		Text
		{
			id: val_c
			width: 28
			font.family: "monospace"
			color: "white"
			
			text:
			{
				if (value_mode == "rgb")
					return rgb[2]
				
				if (value_mode == "hsl")
					return hsl[2]

				if (value_mode == "rgb_hi")
					return (rgb[2] * 255).toFixed(0)
			}
		}
	}

	TextEdit
	{
		id: storage
		visible: false
	}

	MouseArea
	{
		anchors.fill: parent
		hoverEnabled: true

		onEntered:
		{
			root.color = Qt.hsla(0, 0, 1, 0.1)
		}
		onExited:
		{
			root.color = "transparent"
		}
		onClicked:
		{
			storage.text = val_a.text + " " + val_b.text + " " + val_c.text
			storage.selectAll()
			storage.copy()
		}
	}
}