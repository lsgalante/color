import QtQuick

Rectangle
{
	id: root
	height: 20; width: 30
	color: "transparent"

	Text
	{
		id: label
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenter: parent.verticalCenter
		text: mode
		color: Qt.hsla(0, 0, 0.5, 1)
	}

	MouseArea
	{
		anchors.fill: parent
		hoverEnabled: true

		onEntered:
		{
			parent.color = Qt.hsla(0, 0, 0.1, 1)
		}

		onExited:
		{
			parent.color = "transparent"
		}

		onClicked:
		{
			if (encoding_menu.visible == false)
			{
				encoding_menu.visible = true
			}

			else
			{
				encoding_menu.visible = false
			}
		}
	}
}