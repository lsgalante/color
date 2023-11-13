import QtQuick

Rectangle
{
	id: root
	height: 20; width: 200
	y: 200
	color: Qt.hsla(0.3, 0.3, 0.2, 1)

	Xpandr
	{
		id: xpandr
		x: 0
	}

	LiveValues
	{
		anchors.horizontalCenter: parent.horizontalCenter
		value_mode: mode
	}

	EncodingLabel
	{
		id: encoding_label
		anchors.right: parent.right
	}
}