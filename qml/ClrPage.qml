import QtQuick

ClrRect {
    id: root
    anchors.fill: parent
    anchors.topMargin: 5
    visible: {
        if(idx == pagerElement.idx)
            return true;
        else
            return false;
    }

    property var idx: 0
    property var pagerElement
}
