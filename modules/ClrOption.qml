import QtQuick

ClrRect {
    id: root
    height: 20; width: parent.width

    default property alias rowChildren: row.data

    property var title: "option" 
    property var title_width: 80

    Row {
        id: row
        anchors.fill: parent
        height: parent.height; width: parent.width
        spacing: 1

        ClrText {
            id: title
            height: parent.height; width: root.title_width
            left_margin: 10
            main: root.main
            text: root.title
            text_alignment: "left"
        }
    }
}
