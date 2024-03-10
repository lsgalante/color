import QtQuick

Rectangle {
	id    : root
	height: 200
	width : 200
	color : {
		var colorSpace_main = bridge.readColorSpaceMain()

		if(colorSpace_main == "rgb") {
			return Qt.rgba(chVals_main[0], chVals_main[1], chVals_main[2], 1)
		}

		if(colorSpace_main == "hsl") {
			return Qt.hsla(chVals_main[0], chVals_main[1], chVals_main[2], 1)
		}
	}


	MouseArea {	
		anchors.fill: parent
	}
}