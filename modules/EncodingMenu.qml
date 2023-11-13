import QtQuick
import QtQuick.Window

Rectangle
{
	id: root
	height: 31; width: 35
	anchors.bottom: parent.bottom
	anchors.bottomMargin: 40
	anchors.right: tray.right
	color: Qt.hsla(0, 0, 0.5, 1)
	visible: false

	Column
	{
		id: encodings
		anchors.fill: parent
		spacing: 1
		
		EncodingMenuEntry
		{
			id: rgb_entry
			type: "rgb"
		}

		EncodingMenuEntry
		{
			id: hex_entry
			type: "hex"
		}

		EncodingMenuEntry
		{
			id: hsl_entry
			type: "hsl"
		}
	}
}