import Qt5Compat.GraphicalEffects
import QtQuick.Controls.Fusion
import io.qt.textproperties
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects
import QtQuick.Shapes
import QtQuick.Window
import QtQuick


Window
{
	id:window_main
	visible:true
	title:"Color Utility"
	width:210 ; height:225
	color:"transparent"

	flags:Qt.WindowMaximizeButtonHint
		| Qt.WindowMinimizeButtonHint
		| Qt.WindowCloseButtonHint
		| Qt.WindowStaysOnTopHint
		| Qt.WindowSystemMenuHint
		| Qt.FramelessWindowHint
		| Qt.WindowTitleHint
		| Qt.Window

	Bridge { id:bridge }

	property var h:bridge.init_h()
	property var s:bridge.init_s()
	property var l:bridge.init_l()

	property var color_bg:Qt.hsla(0.00, 0.00, 0.16, 0.8)
	property var color_text:Qt.hsla(0.1, 0.1, 0.8, 1.0)
	property var color_preview:Qt.hsla(h, s, l, 1)

	Rectangle
	{
		id:handle
		width:480 ; height:280
		x:0 ; y:0
		color:Qt.hsla(0.5, 0.5, 0.5, 0.0)

		DragHandler
		{ 
			target:null

			onActiveChanged: if (active)
			{
				window_main.startSystemMove();
			}
		}
	}

	Rectangle
	{
		id:panel_bg
		width:parent.width ; height:parent.height ; radius:5
		color:Qt.hsla(0.0, 0.1, 0.25, 0.7)
	}

	Rectangle
	{
		id:panel_left
		width:128 ; height:parent.height-20
		x:10 ; y:10
		color:Qt.hsla(0.1, 0.1, 0.1, 0.5)

		Rectangle
		{ 
			id:preview
			width:128 ; height:175 ; radius:5
			x:0 ; y:0
			color:color_preview
		}

		RowLayout
		{
			id:buttons
			width:parent.width ; height:22
			anchors.bottom:parent.bottom
			spacing: 2.5
			
			Button
			{
				id:button_set
				Layout.preferredWidth:50
				text:"Set"

				onClicked:
				{
					bridge.return_hsl(h, s, l)
					window_main.close()
				}
			}

			Button
			{
				id: button_options
				Layout.preferredWidth:25
				text:"O"
			}

			Button
			{
				id:button_close
				Layout.preferredWidth:50
				text:"Close"

				onClicked:
				{
					// bridge.close_hsl(h, s, l)
					window_main.close()
				}
			}
		}
	}

	Rectangle
	{
		id:panel_right
		width:50 ; height:200
		x:148 ; y:10
		color:Qt.hsla(0.1, 0.1, 0.1, 0.5)

		Text
		{
			id:label_h
			x:6 ; y:0
			color:color_text
			text:"H"
		}

		Text
		{
			id:label_s
			y:0
			anchors.horizontalCenter:parent.horizontalCenter
			color:color_text
			text:"S"
		}

		Text
		{
			id:label_l
			x:37 ; y:0
			color:color_text
			text:"L"
		}

		Slider
		{
			id:slider_h
			from:0 ; to:1 ; value:h
			height:145
			x:4 ; y:20
			orientation:Qt.Vertical

			onMoved: { h = position }
		}

		Slider
		{
			id:slider_s
			from:0 ; to:1 ; value:s
			height:145
			y:20
			anchors.horizontalCenter:parent.horizontalCenter
			orientation:Qt.Vertical

			onMoved: { s = position }
		}

		Slider
		{
			id:slider_l
			from:0 ; to:1 ; value:l
			height:145
			x:33 ; y:20
			orientation:Qt.Vertical

			onMoved: { l = position }
		}

		Rectangle
		{
			id:vals
			visible:false
			width:30 ; height:50 ; radius:7
			x:10 ; y:165
			color:Qt.hsla(0.1, 0.4, 0.3, 0.5)

			Text
			{
				id:val_h
				x:3 ; y:30
				color:color_text
				text:h.toFixed(2) ; font.italic:true
			}

			Text
			{
				id:val_s
				x:3 ; y:15
				color:color_text
				text:s.toFixed(2) ; font.italic:true
			}

			Text
			{
				id:val_l
				x:3 ; y:0
				color:color_text
				text:l.toFixed(2) ; font.italic:true
			}
		}

		TextEdit
		{
			id:storage
			visible:false
		}

		MultiEffect
		{
			id:effect_vals
			source:vals
			anchors.fill:vals
			autoPaddingEnabled:true

			MouseArea
			{
				anchors.fill:parent
				hoverEnabled:true
	
				onEntered: { effect_vals.brightness = 0.1 }

				onExited: { effect_vals.brightness = 0.0 }

				onClicked:
				{
					storage.text = h.toFixed(2) + ", " + s.toFixed(2) + ", " + l.toFixed(2)
					storage.selectAll()
					storage.copy()
				}
			}
			rotation:90
		}
	}

	Rectangle
	{
		id:elem_info
		width:125
		height:45
		x:10
		y:175
		color:"transparent"
	}
}