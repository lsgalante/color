import QtQuick

Rectangle
{
	id: root

	color: Qt.hsla(0.3, 0.3, 0.2, 1)	
	height: 20; width: 200
	y: 200

	Meter
	{
		id: master_meter
	
		encoding: master_encoding; token: master_token
		min_vals: master_min_vals
		max_vals: master_max_vals
		decimal_places: master_decimal_places
	}

	// MouseArea
	// {
	// 	anchors.fill: parent

	// 	onClicked:
	// 	{
	// 		if(dropdown_stae == 0)
	// 		{
	// 			dropdown_state = 1
	// 			dropdown.visible = true
	// 		}

	// 		else
	// 		{
	// 			dropdown_state = 0
	// 			dropdown.visible = false
	// 		}
	// 	}
	// }
}