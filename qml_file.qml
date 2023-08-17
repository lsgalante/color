import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Fusion
import QtQuick.Effects
import QtQuick.Shapes
import QtQuick.Window

import Qt5Compat.GraphicalEffects

Window {

	id: main_window
	title: "Mr. Pickies"

	color: "transparent"

	width: 385
	height: 300

	visible: true

	flags: Qt.WindowStaysOnTopHint | Qt.WindowCloseButtonHint | Qt.WindowSystemMenuHint | Qt.WindowMaximizeButtonHint | Qt.WindowMinimizeButtonHint | Qt.WindowTitleHint | Qt.Window | Qt.FramelessWindowHint 

	property var bg: Qt.hsla(0.00, 0.00, 0.16, 0.8)
	property var txt: Qt.hsla(0.1, 0.1, 0.8, 1.0)

	property var h: 0.10
	property var s: 0.00
	property var l: 0.30
	property var prev_color: Qt.hsla(h, s, l, 1)

	// mr_dragger
	Canvas {
        width:480
        height:280
		y: 0
		x: -100
		opacity: 0.5

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

	// title
	Canvas {
		anchors.fill: parent
		opacity: 0.5

        onPaint: {
            let ctx = getContext("2d");

            let letters = "Mr. Pickies";
            ctx.font = "16px monospace";
		    ctx.fillStyle = txt;

            ctx.translate(62, 43);
            ctx.rotate(-0.58);

            for(let i = 0; i < letters.length; i++) {
            	let letter = letters[i];
			    ctx.fillText(letter, 0, 0);

			  	let len = ctx.measureText(letter);

            	ctx.translate(16, 0);
            	ctx.rotate(.12);
            }
        }
	}

	// select
	Button {
		id: sel_button
		text: "Select"
		onClicked: print('xxx')

		x: 40
		y: 270

		width: 85
	}

	// cancel
	Button {
		id: can_button
		text: "Cancel"
		onClicked: Qt.quit()
		anchors.left: sel_button.right
		anchors.top: sel_button.top

		anchors.leftMargin: 40
		width: 85
	}

	// mr_circle
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

	// menu
	Rectangle {
		id: menu
		color: bg

		width: 50
		height: 200

		anchors.left: circle.right
		anchors.leftMargin: 65
		anchors.verticalCenter: circle.verticalCenter

		Text {
			id: h_label
			color: txt
			text: "H"

			x: 0
			y:0
		}

		Text {
			id: s_label
			color: txt

			text: "S"

			x: 15
			y: 0
		}

		Text {
			id: l_label
			color: txt

			text: "L"

			x: 30
			y: 0
		}

		Slider {
			id: h_slide
			from: 0
			to: 1
			value: h

			height: 150
			orientation: Qt.Vertical

			x: 0
			y: 30

			onMoved: h = position
		}

		Slider {
			id: s_slide
			from: 0
			to: 1
			value: s

			height: 150
			orientation: Qt.Vertical

			x: 15
			y: 30

			onMoved: s = position
		}

		Slider {
			id: l_slide
			from: 0
			to: 1
			value: l

			height: 150
			orientation: Qt.Vertical

			x: 30
			y: 30

			onMoved: l = position
		}

		Text {
			id: h_val
			color: txt

			text: h.toFixed(2)
			font.italic: true

			x: 0
			y: 190

			rotation: 90
		}

		Text {
			id: s_val
			color: txt
			font.italic: true

			text: s.toFixed(2)

			x: 15
			y: 190

			rotation: 90
		}

		Text {
			id: l_val
			color: txt
			font.italic: true

			text: l.toFixed(2)

			x: 30
			y: 190

			rotation: 90
		}
	}
}