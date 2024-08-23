import QtQuick
import QtQuick.Window
import QtQuick.Controls

Column {
    id: root
    anchors.fill:parent
    height: parent.height; width: 200
    spacing: 2
    ColorPageHeader {
    }
    ColorPage {
        id: color_map_page
        color: "red"
        height: 100; width: 200
        visible: true
    }
    ColorPage {
        id: window_page
        color: "pink"
        height: 100; width: 200
        visible: false

        CheckBox {
	        text: "Controls"
	        y: 100
		    checked: true
	        nextCheckState: function() {
		        if(checkState == Qt.Checked) {
				    ctl_win.visible = false;
				    print("Hidden control window");
				    return Qt.Unchecked;
			    } else {
                    ctl_win.visible = true;
                    print("Shown control window");
			        return Qt.Checked;
			    }
			}
		}
    }
}
