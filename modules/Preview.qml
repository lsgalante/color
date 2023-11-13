import QtQuick

Rectangle
{
	id: root
	height: 200; width: 200
	color:
	{
		if (mode == "rgb")
			return Qt.rgba(rgb[0], rgb[1], rgb[2], 1)

		if (mode == "hsl")
			return Qt.hsla(hsl[0], hsl[1], hsl[2], 1)
	}

	MouseArea
	{
		anchors.fill: parent
	}
}