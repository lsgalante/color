import QtQuick

ClrOption {
    id: root
    title: "Show Alpha"

    ClrText {
        id: on
        height: parent.height; width: 50
        main: root.main
        text: {
            if (root.main.connect_alpha == "on")
                return "-On-";
            else
                return "On";
        }
        MouseArea {
            anchors.fill: parent
            onClicked: root.main.connect_alpha = "on";
        }
    }

    ClrText {
        id: off
        height: parent.height; width: 50
        main: root.main
        text: {
            if (root.main.connect_alpha == "off")
                return "-Off-"
            else
                return "Off"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: root.main.connect_alpha = "off";
        }
    }
}
