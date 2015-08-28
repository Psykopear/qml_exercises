import QtQuick 2.4

import Mut 0.1

ApplicationWindow {
    id: app
    visible: true

    pageStack.initialItem: page

    Component {
        id: page

        Page {
            title: qsTr("Page")

            Paper {
                anchors.fill: parent
            }
        }
    }
}

