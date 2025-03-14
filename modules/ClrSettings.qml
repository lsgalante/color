import QtQuick

Column {
    id: root
    height: parent.height; width: parent.width

    property var main

    ClrTabBar {
        id: tabBar
        main: root.main

        ClrTab {
            id: tabFormat
            idx: 0
            label: "Format"
            main: root.main
            tabBarElement: tabBar
            width: parent.width / 2
        }
        ClrTab {
            id: tabOptions
            idx: 1
            label: "Options"
            main: root.main
            tabBarElement: tabBar
            width: parent.width / 2
        }
    }

    Rectangle {
        id: divider
        color: "#7f7f7f"
        height: 0.5; width: parent.width
    }
    
    ClrPager {
        id: pager
        height: parent.height - tabBar.height - divider.height
        main: root.main
        tabBarElement: tabBar

        ClrPageFormat {
            id: pageFormat
            idx: 0
            main: root.main
            pagerElement: pager
        }

        ClrPageOptions {
            id: pageOptions
            idx: 1
            main: root.main
            pagerElement: pager
        }
    }
}
