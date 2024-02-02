import QtQuick

Rectangle
{
	id: root

	color:
	{
		if(master_encoding == "rgb") { return Qt.rgba(master_vals[0], master_vals[1], master_vals[2], 1) }
		if(master_encoding == "hsl") { return Qt.hsla(master_vals[0], master_vals[1], master_vals[2], 1) }
	}
	height: 200; width: 200

	MouseArea
	{
		anchors.fill: parent
	}
}