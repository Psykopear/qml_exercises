import QtQuick 2.4
import QtQuick.Controls 1.3

import Mut 0.1
import Mut.ListItems 0.1

ApplicationWindow {
    id: app
    visible: true

    pageStack.initialItem: page

    Component {
        id: page

        ListView {
            width: parent.width
            height: parent.height
            model: 5

            delegate: SingleLineItem {
                text: "Single line item"
                primaryAction: Action {
                    onTriggered: pageStack.push(secondaryPage)
                }
            }
        }
    }

    Component {
        id: secondaryPage

        SingleLineItem {
            text: "WOO"
            primaryAction: Action {
                onTriggered: pageStack.pop()
            }
        }
    }

}

