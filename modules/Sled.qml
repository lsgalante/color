import QtQuick

Rectangle
{
	id: root

	property var idx: 0
	property var val: bridge.sledPosToVal(sled.y, height)
	
	color: "black"
	height: 350; width: 20

	Rectangle
	{
		id: sled

		height: 6; width: parent.width
		y: master_sled_pos[idx]
		anchors.left: parent.left
	}

	Rectangle
	{
	    id: val_container

	    color: "transparent"
	    height: 20; width: 50
	    rotation: 90
	    anchors.centerIn: parent

	    Text
	    {
	    	color: Qt.hsla(0.00, 0.00, 0.35, 1.00)
	    	text: val.toFixed(2)
	    	anchors.centerIn: parent
	    }
	}

	MouseArea
	{
		anchors.fill: parent

		drag { axis: Drag.YAxis; maximumY: parent.height - sled.height; minimumY: 0; target: sled }

		onPositionChanged:
		{
			var new_vals = master_vals;
			new_vals[idx] = val;
			master_vals = new_vals;
			// bridge.setMasterVals(new_vals);
			// var test = bridge.readMasterVals();
		}
	}
}