import QtQuick

Rectangle {
	id: root
	x: 10
	width: 150
	anchors {
		top: panel_left.bottom
		topMargin: 10
	}
	Row {
		id: panel_bottom_row
		spacing: 2

		MyButton { label: "Set" }
		MyButton { label: "Options" }
		MyButton {
			label: "Close"
			MouseArea {
				anchors { fill: parent }
				onClicked:
				{ window_main.close() }
			}
		}
	}
	TextEdit {
		id: storage
		visible: false
	}
	// MultiEffect
	// {
	// 	id: effect_vals
	// 	source: vals
	// 	autoPaddingEnabled: true
	// 	rotation: 90
	// 	anchors
	// 	{
	// 		fill: vals
	// 	}
	// 	MouseArea
	// 	{
	// 		hoverEnabled: true
	// 		anchors
	// 		{
	// 			fill: parent
	// 		}
	// 		onEntered:
	// 		{
	// 			effect_vals.brightness=0.1
	// 		}
	// 		onExited:
	// 		{
	// 			effect_vals.brightness=0.0
	// 		}
	// 		onClicked:
	// 		{
	// 			storage.text = h.toFixed(2) + ", " + s.toFixed(2) + ", " + l.toFixed(2)
	// 			storage.selectAll()
	// 			storage.copy()
	// 		}
	// 	}
	// }
}