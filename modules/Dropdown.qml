import QtQuick
import QtQuick.Window

Window
{
	id: dropdown

	visible: true
	color: "black"
	height: 200; width: 200
	x: main_window.x; y: main_window.y + main_window.height + 20

	Column
	{
		spacing: 2

		Meter
		{
			id: rgb_lo

			encoding: "rgb"; token: "rgb_lo"
			min_vals: [0.00, 0.00, 0.00]
			max_vals: [1.00, 1.00, 1.00]
			decimal_places: [2, 2, 2]
		}

		Meter
		{
			id: rgb_hi

			encoding: "rgb"; token: "rgb_hi"
			min_vals: [0, 0, 0]
			max_vals: [255, 255, 255]
			decimal_places: [0, 0, 0]
		}

		Meter
		{
			id: hsl_lo

			encoding: "hsl"; token: "hsl_lo"
			min_vals: [0.00, 0.00, 0.00]
			max_vals: [1.00, 1.00, 1.00]
			decimal_places: [2, 2, 2]
		}

		Meter
		{
			id: hsl_hi
			
			encoding: "hsl"; token: "hsl_hi"
			min_vals: [0, 0, 0]
			max_vals: [255, 100, 100]
			decimal_places: [0, 0, 0]
		}
	}
}
