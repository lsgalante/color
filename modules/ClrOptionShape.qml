import QtQuick

ClrOption {
    id: root
    title: "Shape"

    ClrText {
        id: square
        height: parent.height; width: 50
        main: root.main
        text: {
            if(root.main.shape == "square")
                return "-Square-"
            else
                return "Square"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: root.main.shape = "square"
        }
    }

    ClrText {
        id: circle
        height: parent.height; width: 50
        main: root.main
        text: {
            if (root.main.shape == "circle")
                return "-Circle-"
            else
                return "Circle"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: root.main.shape = "circle"
        }
    }
}
