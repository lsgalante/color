import QtQuick

ClrOption {
    id: root
    title: "Preview"

    ClrText {
        id: option_off
        height: parent.height; width: 50
        main: root.main
        text: {
            if(root.main.preview == "off")
                return "-Off-"
            else
                return "Off"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: root.main.preview = "off"
        }
    }

    ClrText {
        id: option_on
        height: parent.height; width: 50
        main: root.main
        text: {
            if (root.main.preview == "on")
                return "-On-"
            else
                return "On"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: root.main.preview = "on"
        }
    }
}
