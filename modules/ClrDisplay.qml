import QtQml
import QtQuick

ClrRect {
    id : root
    anchors.fill: parent

    radius: {
        if(root.main.shape == "square")
            return 0
        else if(root.main.shape == "circle")
            return 100
    }
    color: {
        return Qt.rgba(root.main.ch0, root.main.ch1, root.main.ch2, 1.0);
    }
    
    MouseArea {
        anchors.fill: parent
        property point clickPos: Qt.point(0,0)

        onPressed: (mouse)=> {
            clickPos = Qt.point(mouse.x, mouse.y)
        }

        onPositionChanged: (mouse)=> {
            if (pressed) {
                var delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)
                root.main.colorWin.x += delta.x
                root.main.colorWin.y += delta.y
            }
        }
    }
}
