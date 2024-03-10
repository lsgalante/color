import QtQuick

Rectangle {
	id    : root
	color : "black"
	height: 350
	width : 20

	property var idx: -1
	property var pos: sledPstns_main[idx]

	Rectangle {
		id          : sled
		height      : 6
		width       : parent.width
		y           : pos
		anchors.left: parent.left
	}

	Rectangle {
	    id              : label_container
	    color           : "transparent"
	    height          : 20
	    width           : 50
	    rotation        : 90
	    anchors.centerIn: parent

	    Text {
	    	color           : Qt.hsla(0.00, 0.00, 0.35, 1.00)
	    	text            : sled.y.toFixed(2)
	    	anchors.centerIn: parent
	    }
	}

	MouseArea {
		anchors.fill: parent

		drag {
			target  : sled
			axis    : Drag.YAxis
			maximumY: parent.height - sled.height
			minimumY: 0
		}

		onPositionChanged: {
			sledPstns_main[idx] = sled.y;
			chVals_main = bridge.sledPstnsToChVals(sledPstns_main, 350);

			bridge.setSledPstnsMain(sledPstns_main);
			bridge.setChValsMain(chVals_main);
			bridge.setReadoutsMain();

			readouts = bridge.readReadoutsMain();
		}
	}
}