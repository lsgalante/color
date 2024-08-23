import QtQuick
import QtQuick.Window
import QtQml
import io.qt.textproperties 1.0
import "./color_modules"

Window {
    color: "blue"
    flags: Qt.FramelessWindowHint
    height: 200; width: 200
	id: root
	visible: true
	x: Screen.width - 400 - 10; y: Screen.height - 200 - 25

	Bridge { id: bridge }
	// ColorContainer { id: color_container }
	ColorWindowSettings { id: setting_window }
    ColorWindowControls {}
    onClosing: { print("Exiting"); }

	property var state: {
        "map": "rgb_lo",
        "val_arr": [0, 0, 0],
        "p_arr": [0, 0, 0],
        "label": "label"
    }
    property var maps: {
        "rgb_lo": {
            "encoding": "rgb",
            "min": [0.00, 0.00, 0.00],
            "max": [1.00, 1.00, 1.00]
        },
        "rgb_hi": {
            "encoding": "rgb",
            "min": [0, 0, 0],
            "max": [255, 255, 255]
        },
        "hsl_lo": {
            "encoding": "hsl",
            "min": [0.00, 0.00, 0.00],
            "max": [1.00, 1.00, 1.00]
        },
        "hsl_hi": {
            "encoding": "hsl",
            "min": [0, 0, 0],
            "max": [360, 100, 100]
        },
        "hex": {
            "encoding": "hex",
            "min": [0, 0, 0],
            "max": [255, 255, 255]
        }
    }
}
