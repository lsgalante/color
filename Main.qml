// Main.qml
import QtQuick
import QtQuick.Window
import QtQml
import io.qt.textproperties 1.0
import "./modules"

// root window
Window {
    id: root
    // lags: Qt.FramelessWindowHint
    visible: true
    color: "blue"
    height: 200; width: 200
    x: 400; y: Screen.height - 200 - 25
    property string settings_tab_active: "tab_color_format"
    property var ch0: 0.6
    property var ch1: 0.5
    property var ch2: 0.4
    property var ch3: 1.0
    // onCh0Changed: console.log(ch0)
    
    // color display
    ColorDisplay {id: color_display}
       
    // control panel
    Window {
        id: test
        visible: true
        height: 200; width: 300
        ColorControls { 
            height: parent.height; width: 100
        }
        Rectangle {
            color: "black"
            height: parent.height; width: 200
            x: 100
            ColorSettings { }
        }
    } 

    Bridge {id: bridge}
    onClosing: print("Exiting");
    // property var rgb_val_arr: [0, 0, 0]
    // property var format: "rgb"
    // property var state: {
    //     "format": "rgb_lo",
    //     "val_arr": [0, 0, 0],
    //     "p_arr": [0, 0, 0],
    //     "label": "label"
    // }

    // property var formats: {
    //     "rgb_lo": {
    //         "encoding": "rgb",
    //         "min": [0.00, 0.00, 0.00],
    //         "max": [1.00, 1.00, 1.00]
    //     },
    //     "rgb_hi": {
    //         "encoding": "rgb",
    //         "min": [0, 0, 0],
    //         "max": [255, 255, 255]
    //     },
    //     "hsl_lo": {
    //         "encoding": "hsl",
    //         "min": [0.00, 0.00, 0.00],
    //         "max": [1.00, 1.00, 1.00]
    //     },
    //     "hsl_hi": {
    //         "encoding": "hsl",
    //         "min": [0, 0, 0],
    //         "max": [360, 100, 100]
    //     },
    //     "hex": {
    //         "encoding": "hex",
    //         "min": [0, 0, 0],
    //         "max": [255, 255, 255]
        // }
    // }
}
