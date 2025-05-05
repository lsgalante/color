import QtQuick
import Qt.labs.qmlmodels
import QtQuick.Controls

ClrPage {
    TreeView {
        id: treeView
        model: treeModel

        delegate: TreeViewDelegate {
            id: treeDelegate
            text: model.display
        }
    }
}




/* ClrOptionShape { */
            /* main: root.main */
        /* } */

        /* ClrOptionConnectAlpha { */
            /* main: root.main */
        /* } */

        /* ClrOptionPreview { */
            /* main: root.main */
        /* } */

