import QtQuick 2.4
import QtQuick.Controls 1.3

import Mut 0.1
import Mut.ListItems 0.1
import Mut.Themes 0.1

ApplicationWindow {
    id: app
    visible: true
    title: qsTr("My uselessly shiny app")

    pageStack.initialItem: page

    Component.onCompleted: {
        Theme.imageAssetsPath = "qrc:///icons/";
    }

    Component {
        id: page

        Page {
            title: qsTr("ListViews")
            navAction: Action {
                iconSource: Theme.image("more_vert.svg")
                onTriggered: {
                    Qt.quit()
                }
            }

            Paper {
                anchors.fill: parent

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
        }
    }

    Component {
        id: secondaryPage

        Page {
            title: qsTr("Second page")

            SingleLineItem {
                text: "WOO"
            }
        }
    }

}

