import QtQuick
import QtQuick.Window
import "modules"

import io.qt.textproperties 1.0

Window
{
	id: main_window
	height: 220; width: 200
	x: Screen.width - width - 30; y: 50
	color: "black"
	visible: true

	property var mode: "rgb"
	property var pos_a: (1.00 - controls.pos_a).toFixed(2)
	property var pos_b: (1.00 - controls.pos_b).toFixed(2)
	property var pos_c: (1.00 - controls.pos_c).toFixed(2)
	property var alpha: 1

	Bridge
	{
		id: bridge
	}

	property var rgb:
	{
		if (mode == "rgb")
			return [pos_a, pos_b, pos_c]

		if (mode == "hsl")
			var _rgb = bridge.hsl_to_rgb(pos_a, pos_b, pos_c)
			return [_rgb[0].toFixed(2), _rgb[1].toFixed(2), _rgb[2].toFixed(2)]
	}

	property var hsl:
	{
		if (mode == "hsl")
			return [pos_a, pos_b, pos_c]

		if (mode == "rgb")
			var _hsl = bridge.rgb_to_hsl(pos_a, pos_b, pos_c)
			return [_hsl[0].toFixed(2), _hsl[1].toFixed(2), _hsl[2].toFixed(2)]
	}

	property var prev_rgba: Qt.rgba(rgb[0], rgb[1], rgb[2], 1.00)
	property var prev_hsla: Qt.hsla(hsl[0], hsl[1], hsl[2], 1.00)
	property var dropown_state: 0

	Preview
	{
		id: preview
	}
	Tray
	{
		id: tray
	}
	Dropown
	{
		id: dropown
	}
	EncodingMenu
	{
		id: encoding_menu
	}
	Controls
	{
		id: controls
	}
}
