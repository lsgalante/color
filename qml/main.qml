import QtQuick
import QtQuick.Window
import QtQml
import "."
import "../shaders"

// Base window
Window {
    id: main
    color: "transparent"
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
    height: 200; width: 300
    title: "test"
    visible: true
    x: 1400; y: 600

    // Base Vars
    property string format: "rgb"
    property string shape: "square"
    property var ch0: 0.6
    property var ch1: 0.5
    property var ch2: 0.4
    property var ch3: 1.0
    property var color_bg: "#000000"
    property var color_fg: "#7F7F7F"
    // property var colorWin: colorWin
    property var connect_alpha: "on"
    property var preview: "off"


     Row {
         anchors.fill: parent
        
         /* ClrControls {  */
             /* height: parent.height; width: 100 */
             /* main: main */
         /* } */

         /* Column { */
    
             /* ClrSettings { */
                 /* id: settings */
                 /* height: 150; width: 200 */
                 /* main: main */
             /* } */
    
             /* Rectangle { */
                 /* color: "transparent" */
                 /* height: 50; width: 200 */

                 /* ShaderEffect { */
                     /* anchors.fill: parent */
                     /* fragmentShader: "./shaders/mask.frag.qsb" */
                     /* property var source: parent */
                     /* property real sizex: parent.width */
                     /* property real sizey: parent.height */
                     /* property real radius: 15 */
                    // property color rectColor: "blue"
                 /* } */
          
                 /* MouseArea { */
                     /* anchors.fill: parent */
                     /* property point clickPos: Qt.point(0, 0) */
                     /* onPressed: (mouse) => { clickPos = Qt.point(mouse.x, mouse.y) } */
                     /* onPositionChanged: (mouse)=> { */
                         /* if (pressed) { */
                             /* var delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y) */
                             /* main.x += delta.x */
                             /* main.y += delta.y */
                         /* } */
                     /* } */
                 /* } */
             /* } */
         /* } */
     }

    // Other Windows
     /* Window { */
         /* id: colorWin */
         /* color: Qt.rgba(0.0, 0.0, 0.0, 0.0) */
         /* flags: Qt.FramelessWindowHint */
         /* height: 200; width: 200 */
         /* visible: { */
             /* if (main.preview == "on") */
                 /* return true */
             /* else */
                 /* return false */
         /* } */
         /* x: 1500; y: 850 */
        
         /* ClrDisplay { */
             /* id: test */
             /* main: main */
         /* } */
     /* } */

    onClosing: print("Exiting");
}
