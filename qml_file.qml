import Qt5Compat.GraphicalEffects
import QtQuick.Controls.Fusion
import io.qt.textproperties
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Shapes
import QtQuick.Window
import QtQuick


Window {
	id: window_main
	visible: true

	title: "Please Colors"
	width: 210 ; height: 225
	color: "transparent"

	flags: Qt.WindowMaximizeButtonHint
		| Qt.WindowMinimizeButtonHint
		| Qt.WindowCloseButtonHint
		| Qt.WindowStaysOnTopHint
		| Qt.WindowSystemMenuHint
		| Qt.FramelessWindowHint
		| Qt.WindowTitleHint
		| Qt.Window

	Bridge { id: bridge }

	// data
	property var h: bridge.init_h()
	property var s: bridge.init_s()
	property var l: bridge.init_l()

	// colors
	property var color_bg: Qt.hsla(0.00, 0.00, 0.16, 0.8)
	property var color_text: Qt.hsla(0.1, 0.1, 0.8, 1.0)
	property var color_preview: Qt.hsla(h, s, l, 1)

	// dragger
	Rectangle {
		id: dragger

		width: 480 ; height: 280
		x: -100 ; y: 0
		color: Qt.hsla(0.5, 0.5, 0.5, 0.0)

		DragHandler { 
			target: null

			onActiveChanged: if (active) {
				elem_window.startSystemMove();
			}
		}
	}
	// panel_bg
	Rectangle {
		id: panel_bg

		width: parent.width ; height: parent.height ; radius: 5
		color: Qt.hsla(0.0, 0.1, 0.25, 0.7)
	}
	// panel_left
	Rectangle {
		id: panel_left

		width: 128 ; height: parent.height - 20
		x: 10 ; y: 10
		color: Qt.hsla(0.1, 0.1, 0.1, 0.5)

		// prewiew
		Rectangle { 
			id: preview

			width: 128 ; height: 128 ; radius: 5
			x: 0 ; y: 0
			color: color_preview
		}
		// button_set
		Button {
			id: button_set

			width: 50 ; height: 22
			x: 0 ; y: parent.height - height
			text: "Set"

			onClicked: {
				// bridge.return_h(h)
				// bridge.return_s(s)
				// bridge.return_l(l)
				bridge.return_hsl(h, s, l)
				window_main.close()
			}
		}
		// button_options
		Button {
			id: button_options

			width: 25 ; height: 22
			x: 50 ; y: button_set.y
			text: "O"
		}
		// button_close
		Button {
			id: button_close

			width: 50 ; height: 22
			x: 75 ; y: button_set.y
			text: "Close"

			onClicked: { window_main.close() }
		}
	}
	// panel_right
	Rectangle {
		id: panel_right

		width: 50 ; height: 200
		x: 148 ; y: 10
		color: Qt.hsla(0.1, 0.1, 0.1, 0.5)
		// label_h
		Text {
			id: label_h

			x: 6 ; y: 0
			color: color_text
			text: "H"
		}
		// label_s
		Text {
			id: label_s

			y: 0
			anchors.horizontalCenter: parent.horizontalCenter
			color: color_text
			text: "S"
		}
		// label_l
		Text {
			id: label_l
			
			x: 37 ; y: 0
			color: color_text
			text: "L"
		}
		// slider_h
		Slider {
			id: slider_h
			from: 0 ; to: 1 ; value: h
			
			height: 145
			x: 4 ; y: 20
			orientation: Qt.Vertical

			onMoved: { h = position }
		}
		// slider_s
		Slider {
			id: slider_s
			from: 0 ; to: 1 ; value: s

			height: 145
			y: 20
			anchors.horizontalCenter: parent.horizontalCenter
			orientation: Qt.Vertical

			onMoved: { s = position }
		}
		// slider_l
		Slider {
			id: slider_l
			from: 0 ; to: 1 ; value: l

			height: 145
			x: 33 ;	y: 20
			orientation: Qt.Vertical

			onMoved: { l = position }
		}
		// vals
		Rectangle {
			id: vals
			visible: false

			width: 30 ;	height: 50 ; radius: 7
			x: 10 ; y: 165
			color: Qt.hsla(0.1, 0.4, 0.3, 0.5)
			// val_h
			Text {
				id: val_h
				
				x: 3 ; 	y: 30
				color: color_text
				text: h.toFixed(2) ; font.italic: true
			}
			// val_s
			Text {
				id: val_s

				x: 3 ; 	y: 15
				color: color_text
				text: s.toFixed(2) ; font.italic: true
			}
			// val_l
			Text {
				id: val_l

				x: 3 ; y: 0
				color: color_text
				text: l.toFixed(2) ; font.italic: true
			}
		}

		TextEdit {
			id: storage
			visible: false
		}

		// effect_vals
		MultiEffect {
			id: effect_vals
			source: vals

			anchors.fill: vals
			autoPaddingEnabled: true

			MouseArea {
				anchors.fill: parent
				hoverEnabled: true
	
				onEntered: { effect_vals.brightness = 0.1 }

				onExited: { effect_vals.brightness = 0.0 }

				onClicked: {
					storage.text = h.toFixed(2) + ", " + s.toFixed(2) + ", " + l.toFixed(2)
					storage.selectAll()
					storage.copy()
				}
			}
			rotation: 90
		}
	}
	// elem_info
	Rectangle {
		id: elem_info
		width: 125
		height: 45
		x: 10
		y: 175
		color: "transparent"
	}
}