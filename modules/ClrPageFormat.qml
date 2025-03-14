import QtQuick

ClrPage {
    id: root
    height: parent.height; width: parent.width
    
    ClrList {
        id:formatList

        ClrFormatRgb {
            idx: 0
            listElement: formatList
            main: root.main
        }
        ClrFormatHsv {
            idx: 1
            listElement: formatList
            main: root.main
        }
        ClrFormatHex {
            idx: 2
            listElement: formatList
            main: root.main
        }
    }

    // ClrRect {
        // id: info
        // anchors.bottom: parent.bottom
        // border.color: "white"; border.width: 1
        // height: 100; width: parent.width
    // }
}
