import QtQuick

Rectangle {
	id    : root
	height: 16
	width : 200
	color : {
		if(encoding_main == encoding) { return Qt.hsla(0.00, 0.30, 0.40, 1.00) }
		else { return Qt.hsla(0, 0, 0.6, 1) }
	}

	property var idx          : 0
	property var readout      : readouts[idx]
	property var encoding     : readout['encoding']
	property var colorSpace   : readout['colorSpace']
	property var chVals       : readout['chVals']
	property var encodingVals: readout['encodingVals']
	property var displayVal   : readout['displayVal']

	Row {
		spacing: 30

		Rectangle {
			id    : label
			color : "transparent"
			height: 16
			width : 50
		
			Text {
				font.family     : "monospace"
				font.pointSize  : 8
				text            : encoding
				anchors.centerIn: parent
			}
		}
		
		Rectangle {
			id    : vals
			color : "transparent"
			height: 16
			width : 100

			Text {
				font.family: "monospace"
				text       : displayVal
			}
		}
	}

	MouseArea {
		hoverEnabled: true
		anchors.fill: parent

		onClicked: {
			encoding_main = encoding;
			bridge.setEncodingMain(encoding);

			colorSpace_main = colorSpace;
			bridge.setColorSpaceMain(colorSpace);

			chVals_main = chVals;
			bridge.setChValsMain(chVals);

			sledPstns_main = bridge.chValsToSledPstns(chVals, 350)
		}
	}
}