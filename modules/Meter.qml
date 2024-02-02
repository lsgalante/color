import QtQuick

Rectangle
{
	id: root

	property var encoding: "rgb"
	property var token: "none"

	property var in_vals: master_vals

	property var min_vals: [0.00, 0.00, 0.00]
	property var max_vals: [1.00, 1.00, 1.00]

	property var converted_vals:
	{
		if(master_encoding == "rgb")
		{
			if(encoding == "rgb") { return in_vals }
			if(encoding == "hsl") { return bridge.rgb_to_hsl(in_vals) }
		}

		if(master_encoding == "hsl")
		{
			if(encoding == "rgb") { return bridge.hsl_to_rgb(in_vals) }
			if(encoding == "hsl") { return in_vals }
		}
	}
	property var decimal_places: [0, 0, 0]
	property var fit_vals: bridge.fitVals(converted_vals, min_vals, max_vals, decimal_places)
	property var readout: bridge.concat([fit_vals[0].toFixed(decimal_places[0]), fit_vals[1].toFixed(decimal_places[1]), fit_vals[2].toFixed(decimal_places[2])])

	color:
	{
		if(master_token == token) { return Qt.hsla(0.00, 0.30, 0.40, 1.00) }
		else { return Qt.hsla(0, 0, 0.6, 1) }
	}
	height: 16; width: 200

	Row
	{
		spacing: 30

		Rectangle
		{
			id: token_label
			color: "transparent"
			height: 16; width: 50

			Text
			{
				font { family: "monospace"; pointSize: 8 }
				text: token
				anchors.centerIn: parent
			}
		}

		Rectangle
		{
			color: "transparent"
			height:16; width: 100

			Text
			{
				font.family: "monospace"
				text: readout
			}
		}
	}

	MouseArea
	{
		hoverEnabled: true
		anchors.fill: parent

		onClicked:
		{
			master_vals = converted_vals;
			// bridge.setMasterVals(master_vals);

			master_encoding = encoding;
			master_token = token;
			master_min_vals = min_vals;
			master_max_vals = max_vals;
			master_decimal_places = decimal_places;

			master_sled_pos = bridge.valToSledPos(master_vals, 350);
		}
	}
}