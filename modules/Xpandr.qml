import QtQuick

Rectangle
{
	id: root
	height: 20; width: 20
	color: "transparent"

	property var dropown_state: 0

	Text
	{
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenter: parent.verticalCenter
		text: "\\/"
		color: Qt.hsla(0, 0, 0.5, 1)
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

			if (dropown_state == 0)
			{
				dropown_state = 1
				dropown.visible = true
			}

			else
			{
				dropown_state = 0
				dropown.visible = false
			}
		}
	}
}