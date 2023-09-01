import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Fusion
import QtQuick.Effects
import QtQuick.Shapes
import QtQuick.Window
import Qt5Compat.GraphicalEffects
import io.qt.textproperties


Window {
	id: main_window
	title: "Please Colors"
	color: "transparent"
	width: 210
	height: 225
	visible: true

	flags: Qt.WindowStaysOnTopHint | Qt.WindowCloseButtonHint | Qt.WindowSystemMenuHint | Qt.WindowMaximizeButtonHint | Qt.WindowMinimizeButtonHint | Qt.WindowTitleHint | Qt.Window | Qt.FramelessWindowHint 

	// ui
	property var bg: Qt.hsla(0.00, 0.00, 0.16, 0.8)
	property var txt: Qt.hsla(0.1, 0.1, 0.8, 1.0)

	// data
	Bridge {
		id: bridge
	}

	property var h: bridge.init_h()
	property var s: bridge.init_s()
	property var l: bridge.init_l()
	property var prev_color: Qt.hsla(h, s, l, 1)

	// handle
	Rectangle {
		id: handle
		color: Qt.hsla(0.5, 0.5, 0.5, 0.0)
		width: 480
		height: 280
		x: -100
		y: 0

		DragHandler { 
			id: window_move
			target: null

			onActiveChanged: if (active) { main_window.startSystemMove(); }
		}
	}

	// bg
	Rectangle {
		width: parent.width
		height: parent.height
		radius: 5
		color: Qt.hsla(0.0, 0.1, 0.25, 0.7)
	}

	// preview
	Rectangle {
		id: circle
		color: prev_color
		width: 128
		height: 128
		radius: 5
		x: 10
		y: 10
	}

	// set
	Button {
		id: set
		text: "Set"
		width: 50
		height: 22
		x: 10
		y: 145

		onClicked: { bridge.test(h, s, l) }
	}

	// options
	Button {
		id: options
		text: "O"
		width: 25
		height: 22
		x: 62.5
		y: 145

		// onClicked: { bridge.t2() }
	}

	// close
	Button {
		id: close
		text: "Close"
		width: 50
		height: 22
		x: 90
		y: 145

		onClicked: {
			bridge.set_h(h)
			bridge.set_s(s)
			bridge.set_l(l)
			main_window.close()
		}
	}

	// menu
	Rectangle {
		id: menu
		color: bg
		width: 50
		height: 200
		anchors.left: circle.right
		anchors.leftMargin: 10
		y: 10

		// label_h
		Text {
			id: h_label
			color: txt
			text: "H"
			x: 6
			y: 0
		}

		// label_s
		Text {
			id: s_label
			color: txt
			text: "S"
			anchors.horizontalCenter: menu.horizontalCenter
			y: 0
		}

		// label_l
		Text {
			id: l_label
			color: txt
			text: "L"
			x: 37
			y: 0
		}

		// slider_h
		Slider {
			id: h_slide
			from: 0
			to: 1
			value: h
			height: 145
			orientation: Qt.Vertical
			x: 4
			y: 20

			onMoved: { h = position }
		}

		// slider_s
		Slider {
			id: s_slide
			from: 0
			to: 1
			value: s
			height: 145
			orientation: Qt.Vertical
			anchors.horizontalCenter: menu.horizontalCenter
			y: 20

			onMoved: { s = position }
		}

		// slider_l
		Slider {
			id: l_slide
			from: 0
			to: 1
			value: l
			height: 145
			orientation: Qt.Vertical
			x: 33
			y: 20

			onMoved: { l = position }
		}

		// value_box
		Rectangle {
			id: value_box
			color: Qt.hsla(0.1, 0.4, 0.3, 0.5)
			radius: 7
			visible: false
			width: 30
			height: 50
			x: 10
			y: 165

			Text {
				id: h_val
				color: txt
				text: h.toFixed(2)
				font.italic: true
				x: 3
				y: 30
			}

			Text {
				id: s_val
				color: txt
				font.italic: true
				text: s.toFixed(2)
				x: 3
				y: 15
			}

			Text {
				id: l_val
				color: txt
				font.italic: true
				text: l.toFixed(2)
				x: 3
				y: 0
			}
		}

		TextEdit {
			id: storage
			visible: false
		}

		// value_box_effect
		MultiEffect {
			id: value_effect
			anchors.fill: value_box
			source: value_box
			autoPaddingEnabled: true

			MouseArea {
				anchors.fill: parent
				hoverEnabled: true
	
				onEntered: { value_effect.brightness = 0.1 }

				onExited: { value_effect.brightness = 0.0 }

				onClicked: {
					storage.text = h.toFixed(2) + ", " + s.toFixed(2) + ", " + l.toFixed(2)
					storage.selectAll()
					storage.copy()
				}
			}

			rotation: 90
		}
	}

	// info
	Rectangle {
		width: 125
		height: 45
		x: 10
		y: 175
		color: "transparent"
	}
}