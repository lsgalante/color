import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Fusion
import QtQuick.Effects
import QtQuick.Shapes
import QtQuick.Window

import io.qt.textproperties
import Qt5Compat.GraphicalEffects

Window {

	id: main_window
	title: "Mr. Pickies"

	// color: Qt.hsla(0.1, 0.1, 0.1, 0.0)
	color: "transparent"

	width: 385
	height: 300

	visible: true

	flags: Qt.WindowStaysOnTopHint | Qt.WindowCloseButtonHint | Qt.WindowSystemMenuHint | Qt.WindowMaximizeButtonHint | Qt.WindowMinimizeButtonHint | Qt.WindowTitleHint | Qt.Window | Qt.FramelessWindowHint 

	property var bg: Qt.hsla(0.00, 0.00, 0.16, 0.8)
	property var txt: Qt.hsla(0.1, 0.1, 0.8, 1.0)

	// property var h: 0.10
	property var h: bridge.test_def(0.0)
	property var s: 0.00
	property var l: 0.30
	property var prev_color: Qt.hsla(h, s, l, 1)

	Bridge {
		id: bridge
	}

	// title
	Rectangle {
		id: title
		color: Qt.hsla(0.5, 0.5, 0.5, 0.0)

		width: 480
		height: 280

		x: -100
		y: 0

		// title_dragger
		Canvas {
			id: title_dragger
			anchors.fill: parent

			onPaint: {
				let ctx = getContext("2d");

				ctx.strokeStyle = bg;
				ctx.lineCap = "round";
				ctx.lineWidth = 40;
				ctx.beginPath();
				
				let x = width / 2;
				let y = height / 2;
				let r = width / 4;
				let startAngle = Math.PI * 1.3;
				let endAngle = Math.PI * 1.7;
				let counterclockwise = false;

				ctx.arc(x, y, r, startAngle, endAngle, counterclockwise);
				ctx.stroke();
			}

			DragHandler { 
				id: window_move
				target: null
				onActiveChanged: if (active) { main_window.startSystemMove(); }
			}
		}

		// title_label
		Canvas {
			id: title_label
			anchors.fill: parent

			onPaint: {
				let ctx = getContext("2d");

				let letters = "Mr. Pickies";
				ctx.font = "16px monospace";
				ctx.fillStyle = txt;

				ctx.translate(163, 40);
				ctx.rotate(-0.55);

				for(let i = 0; i < letters.length; i++) {
					let letter = letters[i];
					ctx.fillText(letter, 0, 0);

					let len = ctx.measureText(letter);

					ctx.translate(16, 0);
					ctx.rotate(.12);
				}
			}
		}
	}

	// options
	Rectangle {
		id: options_container
		color: Qt.hsla(0.5, 0.5, 0.5, 0.0)
		visible: false

		width: 80
		height: 50

		anchors.horizontalCenter: circle.horizontalCenter
		y: 240

		Rectangle {
			id: options_bg
			color: Qt.hsla(0.5, 0.5, 0.5, 0.0)
			anchors.fill: parent
			property var abg: "white"

			Canvas {
				id: options_bg_canvas
				anchors.fill: parent;

				onPaint: {
					let ctx = getContext("2d");
					ctx.translate(0, -20);

					ctx.strokeStyle = bg;
					ctx.lineCap = "round";
					ctx.lineWidth = 40;
					
					let x = width / 2;
					let y = height / 2;
					let r = width / 4;
					let startAngle = Math.PI * 0.4;
					let endAngle = Math.PI * 2.6;
					let counterclockwise = true;

					ctx.beginPath();
					ctx.arc(x, y, r, startAngle, endAngle, counterclockwise);
					ctx.stroke();
				}
			}
		}

		Rectangle {
			id: options_label
			color: Qt.hsla(0.5, 0.5, 0.5, 0.0)

			anchors.fill: parent

			Canvas {
				anchors.fill: parent;

				onPaint: { 
					let ctx = getContext("2d");
					ctx.translate(32, 44);
					
					ctx.fillStyle = txt;
					ctx.font = "32px monospace";

					ctx.fillText("◉", 0, 0);
				}
			}
		}
	}

	// options_effect
	MultiEffect {
		id: options_effect
		source: options_container

		anchors.fill: options_container

		brightness: 0.0

		MouseArea {
			anchors.fill: parent
			hoverEnabled: true
			
			onEntered: { options_effect.brightness = 0.1 }

			onExited: { options_effect.brightness = 0.0 }
		}
	}

	// circle_preview
	Rectangle {
		id: circle
		color: prev_color

		radius: 120
		
		width: 240
		height: 240

		x: 20
		y: 20

		layer.enabled: true

		layer.effect: OpacityMask {
			
			invert: true

			maskSource: Item {
				width: 240
				height: 240

				Rectangle {
					id: hole_a
					
					radius: 30
					
					height: 60
					width: 60

					x: -25
					y: 130
				}

				Rectangle {
					id: hole_b
					
					radius: 30
					
					height: 60
					width: 60

					x: 208
					y: 130
				}
			}
		}
	}

	// // select
	// Canvas {
	// 	id: select
	// 	width: 80
	// 	height: 80

	// 	x: 40
	// 	y: 200

	// 	onPaint: {
	// 		let ctx = getContext("2d");
	// 		ctx.strokeStyle = bg;
	// 		ctx.lineCap = "round";
    //         ctx.lineWidth = 40;
    //     	ctx.beginPath();

    //         let x = width / 2;
    //         let y = height / 2;
    //         let r = width / 4;
    //         let startAngle = Math.PI * 0.7;
    //         let endAngle = Math.PI * 2.3;
    //         let counterclockwise = true;

    //         ctx.arc(x, y, r, startAngle, endAngle, counterclockwise);
    //         ctx.stroke();

    //         ctx.font = "16px monospace";
    //         ctx.fillStyle = txt;

    //         let letters = "Select"

    //         for(let i = 0; i < letters.length; i++) {
    //         	let letter = letters[i];
	// 		    ctx.fillText(letter, 0, 0);

	// 		  	let len = ctx.measureText(letter);

    //         	ctx.translate(16, 0);
    //         	ctx.rotate(.12);
    //         }
	// 	}
	// }

	// // cancel
	// Canvas {
	// 	id: cancel
	// 	width: 80
	// 	height: 80

	// 	x: 180
	// 	y: 200

	// 	onPaint: {
	// 		let ctx = getContext("2d");
	// 		ctx.strokeStyle = bg;
	// 		ctx.lineCap = "round";
    //         ctx.lineWidth = 40;
    //     	ctx.beginPath();

    //         let x = width / 2;
    //         let y = height / 2;
    //         let r = width / 4;
    //         let startAngle = Math.PI * 0.7;
    //         let endAngle = Math.PI * 2.3;
    //         let counterclockwise = true;

    //         ctx.arc(x, y, r, startAngle, endAngle, counterclockwise);
    //         ctx.stroke();
	// 	}
	// }

	// menu
	Rectangle {
		id: menu
		color: bg

		width: 50
		height: 200

		anchors.left: circle.right
		anchors.leftMargin: 50
		y: 25

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

			onMoved: h = position
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

			onMoved: s = position
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

			onMoved: l = position
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
				y: 0
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
				y: 30
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
}