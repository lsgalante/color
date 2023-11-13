import QtQuick

Rectangle
{
	id: root
	height: 15; width: 35
	color:
	{
		if (mode == type)
		{
			return Qt.hsla(0, 0, 0.5, 1)
		}
		else
		{
			return Qt.hsla(0, 0, 0.8, 1)
		}
	}

	property var type: "null"

	Text
	{
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenter: parent.verticalCenter
		text: type
	}

	MouseArea
	{
		anchors.fill:parent
		hoverEnabled: true

		onClicked:
		{
			mode = type
		}

		onEntered:
		{
			parent.color = Qt.hsla(0, 0, 0.6, 1)
		}

		onExited:
		{
			parent.color = Qt.hsla(0, 0, 0.8, 1)
		}
	}
}